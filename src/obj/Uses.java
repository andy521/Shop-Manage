package obj;

import java.util.HashSet;
import java.util.Set;

/**
 * Uses entity. @author MyEclipse Persistence Tools
 */

public class Uses implements java.io.Serializable {

	// Fields

	private String useid;
	private String parentid;
	private String name;
	private String url;
	private Integer isone;
	private Set peruses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Uses() {
	}

	/** minimal constructor */
	public Uses(String name, Integer isone) {
		this.name = name;
		this.isone = isone;
	}

	/** full constructor */
	public Uses(String parentid, String name, String url, Integer isone,
			Set peruses) {
		this.parentid = parentid;
		this.name = name;
		this.url = url;
		this.isone = isone;
		this.peruses = peruses;
	}

	// Property accessors

	public String getUseid() {
		return this.useid;
	}

	public void setUseid(String useid) {
		this.useid = useid;
	}

	public String getParentid() {
		return this.parentid;
	}

	public void setParentid(String parentid) {
		this.parentid = parentid;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getIsone() {
		return this.isone;
	}

	public void setIsone(Integer isone) {
		this.isone = isone;
	}

	public Set getPeruses() {
		return this.peruses;
	}

	public void setPeruses(Set peruses) {
		this.peruses = peruses;
	}

}