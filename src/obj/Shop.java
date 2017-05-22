package obj;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Shop entity. @author MyEclipse Persistence Tools
 */

public class Shop implements java.io.Serializable {

	// Fields

	private String shopid;
	private Users users;
	private String name;
	private String priv;
	private String city;
	private String country;
	private String kind;
	private String tel;
	private String powerman;
	private String powertel;
	private Timestamp birthday;
	private Double money;
	private Set goodshouses = new HashSet(0);
	private Set logses = new HashSet(0);
	private Set userses = new HashSet(0);
	private Set positions = new HashSet(0);
	private Set alongs = new HashSet(0);
	private Set shopgoodses = new HashSet(0);
	private Set pershops = new HashSet(0);

	// Constructors

	/** default constructor */
	public Shop() {
	}

	/** minimal constructor */
	public Shop(String name, String priv, String city, String country,
			String kind, String tel, String powerman, String powertel,
			Timestamp birthday, Double money) {
		this.name = name;
		this.priv = priv;
		this.city = city;
		this.country = country;
		this.kind = kind;
		this.tel = tel;
		this.powerman = powerman;
		this.powertel = powertel;
		this.birthday = birthday;
		this.money = money;
	}

	/** full constructor */
	public Shop(Users users, String name, String priv, String city,
			String country, String kind, String tel, String powerman,
			String powertel, Timestamp birthday, Double money, Set goodshouses,
			Set logses, Set userses, Set positions, Set alongs,
			Set shopgoodses, Set pershops) {
		this.users = users;
		this.name = name;
		this.priv = priv;
		this.city = city;
		this.country = country;
		this.kind = kind;
		this.tel = tel;
		this.powerman = powerman;
		this.powertel = powertel;
		this.birthday = birthday;
		this.money = money;
		this.goodshouses = goodshouses;
		this.logses = logses;
		this.userses = userses;
		this.positions = positions;
		this.alongs = alongs;
		this.shopgoodses = shopgoodses;
		this.pershops = pershops;
	}

	// Property accessors

	public String getShopid() {
		return this.shopid;
	}

	public void setShopid(String shopid) {
		this.shopid = shopid;
	}

	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPriv() {
		return this.priv;
	}

	public void setPriv(String priv) {
		this.priv = priv;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return this.country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getKind() {
		return this.kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPowerman() {
		return this.powerman;
	}

	public void setPowerman(String powerman) {
		this.powerman = powerman;
	}

	public String getPowertel() {
		return this.powertel;
	}

	public void setPowertel(String powertel) {
		this.powertel = powertel;
	}

	public Timestamp getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Timestamp birthday) {
		this.birthday = birthday;
	}

	public Double getMoney() {
		return this.money;
	}

	public void setMoney(Double money) {
		this.money = money;
	}

	public Set getGoodshouses() {
		return this.goodshouses;
	}

	public void setGoodshouses(Set goodshouses) {
		this.goodshouses = goodshouses;
	}

	public Set getLogses() {
		return this.logses;
	}

	public void setLogses(Set logses) {
		this.logses = logses;
	}

	public Set getUserses() {
		return this.userses;
	}

	public void setUserses(Set userses) {
		this.userses = userses;
	}

	public Set getPositions() {
		return this.positions;
	}

	public void setPositions(Set positions) {
		this.positions = positions;
	}

	public Set getAlongs() {
		return this.alongs;
	}

	public void setAlongs(Set alongs) {
		this.alongs = alongs;
	}

	public Set getShopgoodses() {
		return this.shopgoodses;
	}

	public void setShopgoodses(Set shopgoodses) {
		this.shopgoodses = shopgoodses;
	}

	public Set getPershops() {
		return this.pershops;
	}

	public void setPershops(Set pershops) {
		this.pershops = pershops;
	}

}