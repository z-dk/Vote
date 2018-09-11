package vote.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import vote.bean.UserOption;
import vote.bean.UserOptionExample;

public interface UserOptionMapper {
    long countByExample(UserOptionExample example);

    int deleteByExample(UserOptionExample example);

    int deleteByPrimaryKey(Integer votedId);

    int insert(UserOption record);

    int insertSelective(UserOption record);

    List<UserOption> selectByExample(UserOptionExample example);

    UserOption selectByPrimaryKey(Integer votedId);

    int updateByExampleSelective(@Param("record") UserOption record, @Param("example") UserOptionExample example);

    int updateByExample(@Param("record") UserOption record, @Param("example") UserOptionExample example);

    int updateByPrimaryKeySelective(UserOption record);

    int updateByPrimaryKey(UserOption record);
}