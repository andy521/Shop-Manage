package obj;

import java.sql.Timestamp;

/**
 * Logs entity. @author MyEclipse Persistence Tools
 */

public class Logs implements java.io.Serializable {

	// Fields

	private String id;
	private Goods goods;
	private Shop shop;
	private Users users;
	private Timestamp time;
	private String upkind;
	private Double number;
	private Double lastnumber;
	private Double salemoney;

	// Constructors

	/** default constructor */
	public Logs() {
	}

	/** minimal constructor */
	public Logs(Users users, Timestamp time, String upkind) {
		this.users = users;
		this.time = time;
		this.upkind = upkind;
	}

	/** full constructor */
	public Logs(Goods goods, Shop shop, Users users, Timestamp time,
			String upkind, Double number, Double lastnumber, Double salemoney) {
		this.goods = goods;
		this.shop = shop;
		this.users = users;
		this.time = time;
		this.upkind = upkind;
		this.number = number;
		this.lastnumber = lastnumber;
		this.salemoney = salemoney;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Goods getGoods() {
		return this.goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public Shop getShop() {
		return this.shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Timestamp getTime() {
		return this.time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public String getUpkind() {
		return this.upkind;
	}

	public void setUpkind(String upkind) {
		this.upkind = upkind;
	}

	public Double getNumber() {
		return this.number;
	}

	public void setNumber(Double number) {
		this.number = number;
	}

	public Double getLastnumber() {
		return this.lastnumber;
	}

	public void setLastnumber(Double lastnumber) {
		this.lastnumber = lastnumber;
	}

	public Double getSalemoney() {
		return this.salemoney;
	}

	public void setSalemoney(Double salemoney) {
		this.salemoney = salemoney;
	}

}