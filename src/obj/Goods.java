package obj;

import java.util.HashSet;
import java.util.Set;

/**
 * Goods entity. @author MyEclipse Persistence Tools
 */

public class Goods implements java.io.Serializable {

	// Fields

	private String goodsid;
	private String name;
	private String picsrc;
	private String kind;
	private Double sellprice;
	private Double autoprice;
	private String idcard;
	private String factory;
	private String savetime;
	private String bounds;
	private String whight;
	private String note;
	private Integer box;
	private Set shopgoodses = new HashSet(0);
	private Set sales = new HashSet(0);
	private Set logses = new HashSet(0);
	private Set goodshouses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Goods() {
	}

	/** minimal constructor */
	public Goods(String name) {
		this.name = name;
	}

	/** full constructor */
	public Goods(String name, String picsrc, String kind, Double sellprice,
			Double autoprice, String idcard, String factory, String savetime,
			String bounds, String whight, String note, Integer box,
			Set shopgoodses, Set sales, Set logses, Set goodshouses) {
		this.name = name;
		this.picsrc = picsrc;
		this.kind = kind;
		this.sellprice = sellprice;
		this.autoprice = autoprice;
		this.idcard = idcard;
		this.factory = factory;
		this.savetime = savetime;
		this.bounds = bounds;
		this.whight = whight;
		this.note = note;
		this.box = box;
		this.shopgoodses = shopgoodses;
		this.sales = sales;
		this.logses = logses;
		this.goodshouses = goodshouses;
	}

	// Property accessors

	public String getGoodsid() {
		return this.goodsid;
	}

	public void setGoodsid(String goodsid) {
		this.goodsid = goodsid;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPicsrc() {
		return this.picsrc;
	}

	public void setPicsrc(String picsrc) {
		this.picsrc = picsrc;
	}

	public String getKind() {
		return this.kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public Double getSellprice() {
		return this.sellprice;
	}

	public void setSellprice(Double sellprice) {
		this.sellprice = sellprice;
	}

	public Double getAutoprice() {
		return this.autoprice;
	}

	public void setAutoprice(Double autoprice) {
		this.autoprice = autoprice;
	}

	public String getIdcard() {
		return this.idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public String getFactory() {
		return this.factory;
	}

	public void setFactory(String factory) {
		this.factory = factory;
	}

	public String getSavetime() {
		return this.savetime;
	}

	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}

	public String getBounds() {
		return this.bounds;
	}

	public void setBounds(String bounds) {
		this.bounds = bounds;
	}

	public String getWhight() {
		return this.whight;
	}

	public void setWhight(String whight) {
		this.whight = whight;
	}

	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Integer getBox() {
		return this.box;
	}

	public void setBox(Integer box) {
		this.box = box;
	}

	public Set getShopgoodses() {
		return this.shopgoodses;
	}

	public void setShopgoodses(Set shopgoodses) {
		this.shopgoodses = shopgoodses;
	}

	public Set getSales() {
		return this.sales;
	}

	public void setSales(Set sales) {
		this.sales = sales;
	}

	public Set getLogses() {
		return this.logses;
	}

	public void setLogses(Set logses) {
		this.logses = logses;
	}

	public Set getGoodshouses() {
		return this.goodshouses;
	}

	public void setGoodshouses(Set goodshouses) {
		this.goodshouses = goodshouses;
	}

}