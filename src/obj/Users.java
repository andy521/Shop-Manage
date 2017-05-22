package obj;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Users entity. @author MyEclipse Persistence Tools
 */

public class Users implements java.io.Serializable {

	// Fields

	private String usersid;
	private Shop shop;
	private Along along;
	private Users users;
	private Position position;
	private String username;
	private String password;
	private Timestamp birthday;
	private String idcard;
	private String realname;
	private Timestamp positionBirthday;
	private String tel;
	private Set logses = new HashSet(0);
	private Set pershops = new HashSet(0);
	private Set peruses = new HashSet(0);
	private Set userses = new HashSet(0);
	private Set shops = new HashSet(0);
	private Set sales = new HashSet(0);

	// Constructors

	/** default constructor */
	public Users() {
	}

	/** minimal constructor */
	public Users(String username, String password, String idcard,
			String realname, Timestamp positionBirthday) {
		this.username = username;
		this.password = password;
		this.idcard = idcard;
		this.realname = realname;
		this.positionBirthday = positionBirthday;
	}

	/** full constructor */
	public Users(Shop shop, Along along, Users users, Position position,
			String username, String password, Timestamp birthday,
			String idcard, String realname, Timestamp positionBirthday,
			String tel, Set logses, Set pershops, Set peruses, Set userses,
			Set shops, Set sales) {
		this.shop = shop;
		this.along = along;
		this.users = users;
		this.position = position;
		this.username = username;
		this.password = password;
		this.birthday = birthday;
		this.idcard = idcard;
		this.realname = realname;
		this.positionBirthday = positionBirthday;
		this.tel = tel;
		this.logses = logses;
		this.pershops = pershops;
		this.peruses = peruses;
		this.userses = userses;
		this.shops = shops;
		this.sales = sales;
	}

	// Property accessors

	public String getUsersid() {
		return this.usersid;
	}

	public void setUsersid(String usersid) {
		this.usersid = usersid;
	}

	public Shop getShop() {
		return this.shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public Along getAlong() {
		return this.along;
	}

	public void setAlong(Along along) {
		this.along = along;
	}

	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Position getPosition() {
		return this.position;
	}

	public void setPosition(Position position) {
		this.position = position;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Timestamp getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Timestamp birthday) {
		this.birthday = birthday;
	}

	public String getIdcard() {
		return this.idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public String getRealname() {
		return this.realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public Timestamp getPositionBirthday() {
		return this.positionBirthday;
	}

	public void setPositionBirthday(Timestamp positionBirthday) {
		this.positionBirthday = positionBirthday;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Set getLogses() {
		return this.logses;
	}

	public void setLogses(Set logses) {
		this.logses = logses;
	}

	public Set getPershops() {
		return this.pershops;
	}

	public void setPershops(Set pershops) {
		this.pershops = pershops;
	}

	public Set getPeruses() {
		return this.peruses;
	}

	public void setPeruses(Set peruses) {
		this.peruses = peruses;
	}

	public Set getUserses() {
		return this.userses;
	}

	public void setUserses(Set userses) {
		this.userses = userses;
	}

	public Set getShops() {
		return this.shops;
	}

	public void setShops(Set shops) {
		this.shops = shops;
	}

	public Set getSales() {
		return this.sales;
	}

	public void setSales(Set sales) {
		this.sales = sales;
	}

}