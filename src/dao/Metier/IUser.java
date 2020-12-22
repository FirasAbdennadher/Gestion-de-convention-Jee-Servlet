package dao.Metier;

import java.util.List;

import entities.User;



public interface IUser {
    void addUser(User u);

    void editUser(User u);

    void deleteUser(int id);
    List<User> getAllUsers();
    User getUser(int id);

}
