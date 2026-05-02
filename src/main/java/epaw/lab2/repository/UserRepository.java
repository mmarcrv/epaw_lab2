package epaw.lab2.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Optional;

import epaw.lab2.model.User;

public class UserRepository extends BaseRepository {
	
	private static UserRepository instance;

	private UserRepository() {
		super();
	}

	public static synchronized UserRepository getInstance() {
		if (instance == null) {
			instance = new UserRepository();
		}
		return instance;
	}

	public boolean existsByUsername(String username) {
		String query = "SELECT COUNT(*) FROM users WHERE name = ?";
		try (PreparedStatement statement = db.prepareStatement(query)) {
            statement.setString(1, username);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
	}
	
	public boolean existsByEmail(String email) {
		String query = "SELECT COUNT(*) FROM users WHERE email = ?";
		try (PreparedStatement statement = db.prepareStatement(query)) {
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
	}
	
	public void save(User user) {
		String query = "INSERT INTO users (name, password, firstName, lastName, email, dateOfBirth, comarca) VALUES (?, ?, ?, ?, ?, ?, ?)";
		try (PreparedStatement statement = db.prepareStatement(query)) {
			statement.setString(1, user.getName());
			statement.setString(2, user.getPassword());
			statement.setString(3, user.getFirstName());
			statement.setString(4, user.getLastName());
			statement.setString(5, user.getEmail());
			statement.setString(6, user.getDateOfBirth());
			statement.setString(7, user.getComarca());
			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
    public Optional<User> findByName(String name) {
        String query = "SELECT id, name, password, firstName, lastName, email, dateOfBirth, comarca FROM users WHERE name = ?";
        try (PreparedStatement statement = db.prepareStatement(query)) {
        	statement.setString(1, name);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setPassword(rs.getString("password"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setEmail(rs.getString("email"));
                user.setDateOfBirth(rs.getString("dateOfBirth"));
                user.setComarca(rs.getString("comarca"));
                return Optional.of(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Optional.empty();
    }
}
