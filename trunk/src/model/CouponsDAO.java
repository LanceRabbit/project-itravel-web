package model;

public interface CouponsDAO {
	public abstract Coupons insert(Coupons coupon);

	public abstract int delete(Coupons coupon);

	public abstract Coupons update(Coupons coupon);

	public abstract Coupons selectById(String id);
}