package vote.bean;

import java.util.List;

public class Limit {
    private Integer id;

    private Integer userId;

    private Integer voteId;
    
    private List<UserOption> userOptions;

   

	public List<UserOption> getUserOptions() {
		return userOptions;
	}

	public void setUserOptions(List<UserOption> userOptions) {
		this.userOptions = userOptions;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getVoteId() {
        return voteId;
    }

    public void setVoteId(Integer voteId) {
        this.voteId = voteId;
    }
}