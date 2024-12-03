package com.neuedu.sports.service;

import java.util.List;
import com.neuedu.sports.domain.SportsFeedback;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 用户反馈Service接口
 * 
 * @author neuedu
 * @date 2024-06-13
 */
public interface ISportsFeedbackService extends IService<SportsFeedback>
{
    /**
     * 查询用户反馈
     * 
     * @param id 用户反馈主键
     * @return 用户反馈
     */
    public SportsFeedback selectSportsFeedbackById(Long id);

    /**
     * 查询用户反馈列表
     * 
     * @param sportsFeedback 用户反馈
     * @return 用户反馈集合
     */
    public List<SportsFeedback> selectSportsFeedbackList(SportsFeedback sportsFeedback);

    /**
     * 新增用户反馈
     * 
     * @param sportsFeedback 用户反馈
     * @return 结果
     */
    public int insertSportsFeedback(SportsFeedback sportsFeedback);

    /**
     * 修改用户反馈
     * 
     * @param sportsFeedback 用户反馈
     * @return 结果
     */
    public int updateSportsFeedback(SportsFeedback sportsFeedback);

    /**
     * 批量删除用户反馈
     * 
     * @param ids 需要删除的用户反馈主键集合
     * @return 结果
     */
    public int deleteSportsFeedbackByIds(Long[] ids);

    /**
     * 删除用户反馈信息
     * 
     * @param id 用户反馈主键
     * @return 结果
     */
    public int deleteSportsFeedbackById(Long id);
}
