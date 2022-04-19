package mimemi.mvc.dto;

public class UserDTO {
	private String userId;
	private String userName;
	private String userPwd;
	private String userPhone;
	private int userPoint;
	private String userRegdate;
	private boolean userQuit;
	private String userBirth;
	
	public UserDTO() {}
//	public UserDTO(String userId, String userPwd) {
//		super();
//		this.userId = userId;
//		this.userPwd = userPwd;
//	}
	public UserDTO(String userId, String userName) {
		super();
		this.userId = userId;
		this.userName = userName;
	}
	public UserDTO(String userPhone) {
		this.userPhone = userPhone;
	}
	public UserDTO(String userId, String userName, String userPwd, String userPhone, int userPoint, String userRegdate,
		boolean userQuit, String userBirth) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.userPhone = userPhone;	
		this.userPoint = userPoint;
		this.userRegdate = userRegdate;
		this.userQuit = userQuit;
		this.userBirth = userBirth;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public int getUserPoint() {
		return userPoint;
	}

	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}

	public String getUserRegdate() {
		return userRegdate;
	}

	public void setUserRegdate(String userRegdate) {
		this.userRegdate = userRegdate;
	}

	public boolean isUserQuit() {
		return userQuit;
	}

	public void setUserQuit(boolean userQuit) {
		this.userQuit = userQuit;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	
	
}
