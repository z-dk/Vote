package vote.bean;

public class User {
    private Integer userId;

    private String userName;

    private String userPassword;

    private Integer phoneNum;

    public Integer getUserId() {
        return userId;
    }

    public User() {
		super();
	}

	public User(String userName, String userPassword, Integer phoneNum) {
		super();
		this.userName = userName;
		this.userPassword = userPassword;
		this.phoneNum = phoneNum;
	}

	public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public Integer getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(Integer phoneNum) {
        this.phoneNum = phoneNum;
    }
}