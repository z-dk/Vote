package vote.bean;

import java.math.BigInteger;

import javax.validation.constraints.Pattern;

public class User {
    @Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userPassword=" + userPassword + ", phoneNum="
				+ phoneNum + "]";
	}

	private Integer userId;
    @Pattern(regexp="(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})"
    		,message="用户名为6-16位英文或2-5位中文")
    private String userName;
    @Pattern(regexp="(^[a-zA-Z0-9_-]{6,16}$)"
    		,message="密码为6-16位，且不能有非法字符")
    private String userPassword;
    
    private BigInteger phoneNum;

    public Integer getUserId() {
        return userId;
    }

    public User() {
		super();
	}

	public User(String userName, String userPassword, BigInteger phoneNum) {
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

    public BigInteger getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(BigInteger phoneNum) {
        this.phoneNum = phoneNum;
    }
}