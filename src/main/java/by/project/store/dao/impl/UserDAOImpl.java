package by.project.store.dao.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import by.project.store.dao.NoResultDAOException;
import by.project.store.dao.PasswordAlreadyExistsDAOException;
import by.project.store.dao.UserDAO;
import by.project.store.entity.Address;
import by.project.store.entity.Role;
import by.project.store.entity.UserShort;
import by.project.store.entity.UserInfo;

@Repository
public class UserDAOImpl implements UserDAO {

 	private static final String LOGIN_PARAMETER = "email";
	private static final String SELECT_USER_BY_LOGIN_HQL = "from UserShort where email = :email";

	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	private BCryptPasswordEncoder encoder;

	public UserShort getUserByLogin(String login) throws NoResultDAOException {

		Session currentSession = sessionFactory.getCurrentSession();
		UserShort userShort = (UserShort) currentSession.createQuery(SELECT_USER_BY_LOGIN_HQL, UserShort.class)
				.setParameter(LOGIN_PARAMETER, login).getSingleResult();

		return userShort;

	}

	public boolean registration(UserInfo userInfo) {

		Session currentSession = sessionFactory.getCurrentSession();

		Role role = currentSession.get(Role.class, 1);

		userInfo.setRole(role);

		userInfo.setPassword(encoder.encode(userInfo.getPassword()));

		currentSession.save(userInfo);

		return true;

	}

	public void changeUserInfo(UserInfo userInfo) {
		Session currentSession = sessionFactory.getCurrentSession();

		currentSession.update(userInfo);

	}

	public UserInfo getUserInfo(int id) {

		Session currentSession = sessionFactory.getCurrentSession();

		UserInfo userInfo = currentSession.get(UserInfo.class, id);

		return userInfo;
	}

	public void deleteUser(int id) {
		// TODO Auto-generated method stub

	}

	public void addAddress(int userId, Address address) {
		// TODO Auto-generated method stub

	}

	public Set<Role> getAllRole() {
		// TODO Auto-generated method stub
		return null;
	}

	public void addRole(String roleName) {
		// TODO Auto-generated method stub

	}

	public void addRoleUser(int userId, int roleId) {
		// TODO Auto-generated method stub

	}

	public void deleteRoleUser(int userId, int roleId) {
		// TODO Auto-generated method stub

	}

}
