package vote.bean;

public class Option {
    private Integer opId;

    private String opName;

    private Integer opTotal;

    private Integer vId;

    private String opBrief;

    public Integer getOpId() {
        return opId;
    }

    public void setOpId(Integer opId) {
        this.opId = opId;
    }

    public Option() {
		super();
	}

	public Option(String opName, Integer vId, String opBrief) {
		super();
		this.opName = opName;
		this.vId = vId;
		this.opBrief = opBrief;
	}

	public String getOpName() {
        return opName;
    }

    public void setOpName(String opName) {
        this.opName = opName;
    }

    public Integer getOpTotal() {
        return opTotal;
    }

    public void setOpTotal(Integer opTotal) {
        this.opTotal = opTotal;
    }

    public Integer getvId() {
        return vId;
    }

    public void setvId(Integer vId) {
        this.vId = vId;
    }

    public String getOpBrief() {
        return opBrief;
    }

    public void setOpBrief(String opBrief) {
        this.opBrief = opBrief;
    }
}