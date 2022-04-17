package repository;

import model.User;

import java.util.List;

public interface IUserRepository {
    public void insertUser(User user);

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public void deleteUser(int id);

    public void updateUser(User user);

    public List<User> searchByName(String name);

    public List<User> searchById(Integer id);
}
