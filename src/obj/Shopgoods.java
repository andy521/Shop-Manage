package obj;

/**
 * Shopgoods entity. @author MyEclipse Persistence Tools
 */

public class Shopgoods implements java.io.Serializable {

	// Fields

	private String id;
	private Goods goods;
	private Shop shop;

	// Constructors

	/** default constructor */
	public Shopgoods() {
	}

	/** full constructor */
	public Shopgoods(Goods goods, Shop shop) {
		this.goods = goods;
		this.shop = shop;
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

}