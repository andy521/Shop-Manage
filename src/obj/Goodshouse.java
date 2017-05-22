package obj;

/**
 * Goodshouse entity. @author MyEclipse Persistence Tools
 */

public class Goodshouse implements java.io.Serializable {

	// Fields

	private String id;
	private Goods goods;
	private Shop shop;
	private Double number;
	private Double buyprice;
	private Integer boxnumber;

	// Constructors

	/** default constructor */
	public Goodshouse() {
	}

	/** minimal constructor */
	public Goodshouse(Double number, Double buyprice) {
		this.number = number;
		this.buyprice = buyprice;
	}

	/** full constructor */
	public Goodshouse(Goods goods, Shop shop, Double number, Double buyprice,
			Integer boxnumber) {
		this.goods = goods;
		this.shop = shop;
		this.number = number;
		this.buyprice = buyprice;
		this.boxnumber = boxnumber;
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

	public Double getNumber() {
		return this.number;
	}

	public void setNumber(Double number) {
		this.number = number;
	}

	public Double getBuyprice() {
		return this.buyprice;
	}

	public void setBuyprice(Double buyprice) {
		this.buyprice = buyprice;
	}

	public Integer getBoxnumber() {
		return this.boxnumber;
	}

	public void setBoxnumber(Integer boxnumber) {
		this.boxnumber = boxnumber;
	}

}