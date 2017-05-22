package obj;

/**
 * Peruse entity. @author MyEclipse Persistence Tools
 */

public class Peruse implements java.io.Serializable {

	// Fields

	private String id;
	private Users users;
	private Uses uses;

	// Constructors

	/** default constructor */
	public Peruse() {
	}

	/** full constructor */
	public Peruse(Users users, Uses uses) {
		this.users = users;
		this.uses = uses;
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

	public Uses getUses() {
		return this.uses;
	}

	public void setUses(Uses uses) {
		this.uses = uses;
	}

}