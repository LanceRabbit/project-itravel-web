package model;

import java.util.List;

public interface AccountDAO {
	public abstract Account insert(Account account);
	public abstract Account update(Account account);
	public abstract boolean updateAccountLevel(String accountId, int accountLevel);
	public abstract Account selectById(String id);
	public abstract Account selectByEmail(String email);
	public abstract List<Account> selectAll();
}
