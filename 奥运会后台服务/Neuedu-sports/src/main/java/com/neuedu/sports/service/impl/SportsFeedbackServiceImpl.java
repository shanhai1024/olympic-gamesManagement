package com.neuedu.sports.service.impl;
import com.neuedu.common.utils.SecurityUtils;
import lombok.RequiredArgsConstructor;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.neuedu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neuedu.sports.mapper.SportsFeedbackMapper;
import com.neuedu.sports.domain.SportsFeedback;
import com.neuedu.sports.service.ISportsFeedbackService;

/**
 * 用户反馈Service业务层处理
 * 
 * @author neuedu
 * @date 2024-06-13
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsFeedbackServiceImpl extends ServiceImpl<SportsFeedbackMapper, SportsFeedback> implements ISportsFeedbackService
{
    private final SportsFeedbackMapper sportsFeedbackMapper;

    /**
     * 查询用户反馈
     * 
     * @param id 用户反馈主键
     * @return 用户反馈
     */
    @Override
    public SportsFeedback selectSportsFeedbackById(Long id)
    {
        return sportsFeedbackMapper.selectSportsFeedbackById(id);
    }

    /**
     * 查询用户反馈列表
     * 
     * @param sportsFeedback 用户反馈
     * @return 用户反馈
     */
    @Override
    public List<SportsFeedback> selectSportsFeedbackList(SportsFeedback sportsFeedback)
    {
        return sportsFeedbackMapper.selectSportsFeedbackList(sportsFeedback);
    }

    /**
     * 新增用户反馈
     * 
     * @param sportsFeedback 用户反馈
     * @return 结果
     */
    @Override
    public int insertSportsFeedback(SportsFeedback sportsFeedback)
    {
        sportsFeedback.setCreateBy(SecurityUtils.getUsername());
        sportsFeedback.setCreateTime(DateUtils.getNowDate());
        return sportsFeedbackMapper.insertSportsFeedback(sportsFeedback);
    }

    /**
     * 修改用户反馈
     * 
     * @param sportsFeedback 用户反馈
     * @return 结果
     */
    @Override
    public int updateSportsFeedback(SportsFeedback sportsFeedback)
    {
        sportsFeedback.setUpdateBy(SecurityUtils.getUsername());
        sportsFeedback.setUpdateTime(DateUtils.getNowDate());
        return sportsFeedbackMapper.updateSportsFeedback(sportsFeedback);
    }

    /**
     * 批量删除用户反馈
     * 
     * @param ids 需要删除的用户反馈主键
     * @return 结果
     */
    @Override
    public int deleteSportsFeedbackByIds(Long[] ids)
    {
        return sportsFeedbackMapper.deleteSportsFeedbackByIds(ids);
    }

    /**
     * 删除用户反馈信息
     * 
     * @param id 用户反馈主键
     * @return 结果
     */
    @Override
    public int deleteSportsFeedbackById(Long id)
    {
        return sportsFeedbackMapper.deleteSportsFeedbackById(id);
    }
}
