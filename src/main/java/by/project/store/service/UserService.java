package by.project.store.service;

import java.util.Set;

import by.project.store.entity.Address;
import by.project.store.entity.Role;
import by.project.store.entity.UserShort;
import by.project.store.entity.UserInfo;

public interface UserService {

	UserShort getUserByLogin(String login) throws NoResultServiceException ;

	boolean registration(UserInfo userInfo) throws InvalidInputServiceException;

	void changeUserInfo(UserInfo userInfo) throws InvalidInputServiceException;

	UserInfo getUserInfo(int id);

	void deleteUser(int id);

	void addAddress(int userId, Address address);

	Set<Role> getAllRole();

	void addRole(String roleName);;

	void addRoleUser(int userId, int roleId);

	void deleteRoleUser(int userId, int roleId);

}
