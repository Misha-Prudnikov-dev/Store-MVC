package by.project.store.dao;

 import java.util.Set;

import by.project.store.entity.Address;
import by.project.store.entity.Role;
import by.project.store.entity.UserShort;
import by.project.store.entity.UserInfo;


public interface UserDAO {

	UserShort getUserByLogin(String login) throws NoResultDAOException;

	boolean registration(UserInfo userInfo)  ;

	void changeUserInfo(UserInfo userInfo)  ;

	UserInfo getUserInfo(int id)  ;

	void deleteUser(int id)  ;

	void addAddress(int userId, Address address) ;
	
	Set<Role> getAllRole() ;
	
	void addRole(String roleName) ;
	
	void addRoleUser(int userId,int roleId) ;
	
	void deleteRoleUser(int userId,int roleId) ;

}
