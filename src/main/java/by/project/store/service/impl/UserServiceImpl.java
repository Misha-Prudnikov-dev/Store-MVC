package by.project.store.service.impl;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import by.project.store.dao.NoResultDAOException;
import by.project.store.dao.PasswordAlreadyExistsDAOException;
import by.project.store.dao.UserDAO;
import by.project.store.entity.Address;
import by.project.store.entity.Role;
import by.project.store.entity.UserShort;
import by.project.store.entity.UserInfo;
import by.project.store.service.InvalidInputServiceException;
import by.project.store.service.NoResultServiceException;
import by.project.store.service.PasswordAlreadyExistsServiceException;
import by.project.store.service.UserService;
import by.project.store.service.validation.Validator;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;

	@Override
	@Transactional
	public UserShort getUserByLogin(String login) throws NoResultServiceException {

		UserShort userAuthorized = null;
		try {
			userAuthorized = userDAO.getUserByLogin(login);
		} catch (NoResultDAOException e) {

			throw new NoResultServiceException(e);

		}

		return userAuthorized;
	}

	@Override
	@Transactional
	public boolean registration(UserInfo userInfo) throws InvalidInputServiceException {

		if (!Validator.userDataValid(userInfo)) {

			throw new InvalidInputServiceException();
		}

		return userDAO.registration(userInfo);

	}

	@Override
	@Transactional
	public void changeUserInfo(UserInfo userInfo) throws InvalidInputServiceException {

		userDAO.changeUserInfo(userInfo);

	}

	@Override
	@Transactional
	public UserInfo getUserInfo(int id) {

		return userDAO.getUserInfo(id);
	}

	@Override
	public void deleteUser(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public void addAddress(int userId, Address address) {
		// TODO Auto-generated method stub

	}

	@Override
	public Set<Role> getAllRole() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addRole(String roleName) {
		// TODO Auto-generated method stub

	}

	@Override
	public void addRoleUser(int userId, int roleId) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteRoleUser(int userId, int roleId) {
		// TODO Auto-generated method stub

	}

}
