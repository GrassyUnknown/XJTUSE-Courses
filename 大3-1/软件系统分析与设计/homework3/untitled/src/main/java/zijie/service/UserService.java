package zijie.service;

import zijie.dao.UserDao;
import zijie.model.User;

public class UserService {
    public User user;

    public UserService(){

    }
    public UserService(User user) {
        this.user = user;
    }

    public static int update(User user) {
        return UserDao.update(user);
    }

    public boolean login(String account,String password){
        user=UserDao.selectByID(Integer.parseInt(account));
        if(user==null){
            return false;
        }
        else if(user.password.equals(password)){
            return true;
        }
        else{
            return false;
        }
    }

    public User searchUser(int iduser) {
        return UserDao.selectByID(iduser);
    }

    public int deleteUser(int iduser) {
        return UserDao.deleteByID(iduser);
    }
}
