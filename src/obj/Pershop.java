package obj;

/**
 * Pershop entity. @author MyEclipse Persistence Tools
 */

public class Pershop implements java.io.Serializable {

	// Fields

	private String id;
	private Users users;
	private Shop shop;
	private Double gufen;

	// Constructors

	/** default constructor */
	public Pershop() {
	}

	/** full constructor */
	public Pershop(Users users, Shop shop, Double gufen) {
		this.users = users;
		this.shop = shop;
		this.gufen = gufen;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Shop getShop() {
		return this.shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public Double getGufen() {
		return this.gufen;
	}

	public void setGufen(Double gufen) {
		this.gufen = gufen;
	}

}