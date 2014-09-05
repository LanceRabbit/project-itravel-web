package model;

import java.util.List;

public interface AccountDAO {
	public abstract Account insert(Account account);
	public abstract Account update(Account account);
	public abstract Account selectById(String id);
	public abstract List<Account> selectAll();
}
