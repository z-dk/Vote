package vote.bean;

import java.util.ArrayList;
import java.util.List;

public class VoteExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public VoteExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andVoteIdIsNull() {
            addCriterion("vote_id is null");
            return (Criteria) this;
        }

        public Criteria andVoteIdIsNotNull() {
            addCriterion("vote_id is not null");
            return (Criteria) this;
        }

        public Criteria andVoteIdEqualTo(Integer value) {
            addCriterion("vote_id =", value, "voteId");
            return (Criteria) this;
        }

        public Criteria andVoteIdNotEqualTo(Integer value) {
            addCriterion("vote_id <>", value, "voteId");
            return (Criteria) this;
        }

        public Criteria andVoteIdGreaterThan(Integer value) {
            addCriterion("vote_id >", value, "voteId");
            return (Criteria) this;
        }

        public Criteria andVoteIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("vote_id >=", value, "voteId");
            return (Criteria) this;
        }

        public Criteria andVoteIdLessThan(Integer value) {
            addCriterion("vote_id <", value, "voteId");
            return (Criteria) this;
        }

        public Criteria andVoteIdLessThanOrEqualTo(Integer value) {
            addCriterion("vote_id <=", value, "voteId");
            return (Criteria) this;
        }

        public Criteria andVoteIdIn(List<Integer> values) {
            addCriterion("vote_id in", values, "voteId");
            return (Criteria) this;
        }

        public Criteria andVoteIdNotIn(List<Integer> values) {
            addCriterion("vote_id not in", values, "voteId");
            return (Criteria) this;
        }

        public Criteria andVoteIdBetween(Integer value1, Integer value2) {
            addCriterion("vote_id between", value1, value2, "voteId");
            return (Criteria) this;
        }

        public Criteria andVoteIdNotBetween(Integer value1, Integer value2) {
            addCriterion("vote_id not between", value1, value2, "voteId");
            return (Criteria) this;
        }

        public Criteria andVoteNameIsNull() {
            addCriterion("vote_name is null");
            return (Criteria) this;
        }

        public Criteria andVoteNameIsNotNull() {
            addCriterion("vote_name is not null");
            return (Criteria) this;
        }

        public Criteria andVoteNameEqualTo(String value) {
            addCriterion("vote_name =", value, "voteName");
            return (Criteria) this;
        }

        public Criteria andVoteNameNotEqualTo(String value) {
            addCriterion("vote_name <>", value, "voteName");
            return (Criteria) this;
        }

        public Criteria andVoteNameGreaterThan(String value) {
            addCriterion("vote_name >", value, "voteName");
            return (Criteria) this;
        }

        public Criteria andVoteNameGreaterThanOrEqualTo(String value) {
            addCriterion("vote_name >=", value, "voteName");
            return (Criteria) this;
        }

        public Criteria andVoteNameLessThan(String value) {
            addCriterion("vote_name <", value, "voteName");
            return (Criteria) this;
        }

        public Criteria andVoteNameLessThanOrEqualTo(String value) {
            addCriterion("vote_name <=", value, "voteName");
            return (Criteria) this;
        }

        public Criteria andVoteNameLike(String value) {
            addCriterion("vote_name like", value, "voteName");
            return (Criteria) this;
        }

        public Criteria andVoteNameNotLike(String value) {
            addCriterion("vote_name not like", value, "voteName");
            return (Criteria) this;
        }

        public Criteria andVoteNameIn(List<String> values) {
            addCriterion("vote_name in", values, "voteName");
            return (Criteria) this;
        }

        public Criteria andVoteNameNotIn(List<String> values) {
            addCriterion("vote_name not in", values, "voteName");
            return (Criteria) this;
        }

        public Criteria andVoteNameBetween(String value1, String value2) {
            addCriterion("vote_name between", value1, value2, "voteName");
            return (Criteria) this;
        }

        public Criteria andVoteNameNotBetween(String value1, String value2) {
            addCriterion("vote_name not between", value1, value2, "voteName");
            return (Criteria) this;
        }

        public Criteria andVoteBriefIsNull() {
            addCriterion("vote_brief is null");
            return (Criteria) this;
        }

        public Criteria andVoteBriefIsNotNull() {
            addCriterion("vote_brief is not null");
            return (Criteria) this;
        }

        public Criteria andVoteBriefEqualTo(String value) {
            addCriterion("vote_brief =", value, "voteBrief");
            return (Criteria) this;
        }

        public Criteria andVoteBriefNotEqualTo(String value) {
            addCriterion("vote_brief <>", value, "voteBrief");
            return (Criteria) this;
        }

        public Criteria andVoteBriefGreaterThan(String value) {
            addCriterion("vote_brief >", value, "voteBrief");
            return (Criteria) this;
        }

        public Criteria andVoteBriefGreaterThanOrEqualTo(String value) {
            addCriterion("vote_brief >=", value, "voteBrief");
            return (Criteria) this;
        }

        public Criteria andVoteBriefLessThan(String value) {
            addCriterion("vote_brief <", value, "voteBrief");
            return (Criteria) this;
        }

        public Criteria andVoteBriefLessThanOrEqualTo(String value) {
            addCriterion("vote_brief <=", value, "voteBrief");
            return (Criteria) this;
        }

        public Criteria andVoteBriefLike(String value) {
            addCriterion("vote_brief like", value, "voteBrief");
            return (Criteria) this;
        }

        public Criteria andVoteBriefNotLike(String value) {
            addCriterion("vote_brief not like", value, "voteBrief");
            return (Criteria) this;
        }

        public Criteria andVoteBriefIn(List<String> values) {
            addCriterion("vote_brief in", values, "voteBrief");
            return (Criteria) this;
        }

        public Criteria andVoteBriefNotIn(List<String> values) {
            addCriterion("vote_brief not in", values, "voteBrief");
            return (Criteria) this;
        }

        public Criteria andVoteBriefBetween(String value1, String value2) {
            addCriterion("vote_brief between", value1, value2, "voteBrief");
            return (Criteria) this;
        }

        public Criteria andVoteBriefNotBetween(String value1, String value2) {
            addCriterion("vote_brief not between", value1, value2, "voteBrief");
            return (Criteria) this;
        }

        public Criteria andUIdIsNull() {
            addCriterion("u_id is null");
            return (Criteria) this;
        }

        public Criteria andUIdIsNotNull() {
            addCriterion("u_id is not null");
            return (Criteria) this;
        }

        public Criteria andUIdEqualTo(Integer value) {
            addCriterion("u_id =", value, "uId");
            return (Criteria) this;
        }

        public Criteria andUIdNotEqualTo(Integer value) {
            addCriterion("u_id <>", value, "uId");
            return (Criteria) this;
        }

        public Criteria andUIdGreaterThan(Integer value) {
            addCriterion("u_id >", value, "uId");
            return (Criteria) this;
        }

        public Criteria andUIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("u_id >=", value, "uId");
            return (Criteria) this;
        }

        public Criteria andUIdLessThan(Integer value) {
            addCriterion("u_id <", value, "uId");
            return (Criteria) this;
        }

        public Criteria andUIdLessThanOrEqualTo(Integer value) {
            addCriterion("u_id <=", value, "uId");
            return (Criteria) this;
        }

        public Criteria andUIdIn(List<Integer> values) {
            addCriterion("u_id in", values, "uId");
            return (Criteria) this;
        }

        public Criteria andUIdNotIn(List<Integer> values) {
            addCriterion("u_id not in", values, "uId");
            return (Criteria) this;
        }

        public Criteria andUIdBetween(Integer value1, Integer value2) {
            addCriterion("u_id between", value1, value2, "uId");
            return (Criteria) this;
        }

        public Criteria andUIdNotBetween(Integer value1, Integer value2) {
            addCriterion("u_id not between", value1, value2, "uId");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}