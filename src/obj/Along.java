package obj;

import java.util.HashSet;
import java.util.Set;

/**
 * Along entity. @author MyEclipse Persistence Tools
 */

public class Along implements java.io.Serializable {

	// Fields

	private String alongid;
	private Shop shop;
	private String alongname;
	private Set userses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Along() {
	}

	/** minimal constructor */
	public Along(Shop shop, String alongname) {
		this.shop = shop;
		this.alongname = alongname;
	}

	/** full constructor */
	public Along(Shop shop, String alongname, Set userses) {
		this.shop = shop;
		this.alongname = alongname;
		this.userses = userses;
	}

	// Property accessors

	public String getAlongid() {
		return this.alongid;
	}

	public void setAlongid(String alongid) {
		this.alongid = alongid;
	}

	public Shop getShop() {
		return this.shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public String getAlongname() {
		return this.alongname;
	}

	public void setAlongname(String alongname) {
		this.alongname = alongname;
	}

	public Set getUserses() {
		return this.userses;
	}

	public void setUserses(Set userses) {
		this.userses = userses;
	}

}