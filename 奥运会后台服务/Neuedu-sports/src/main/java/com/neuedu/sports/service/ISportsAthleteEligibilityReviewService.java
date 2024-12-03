package com.neuedu.sports.service;

import java.util.List;
import com.neuedu.sports.domain.SportsAthleteEligibilityReview;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 运动员管理-参赛资格审核Service接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
public interface ISportsAthleteEligibilityReviewService extends IService<SportsAthleteEligibilityReview>
{
    /**
     * 查询运动员管理-参赛资格审核
     * 
     * @param id 运动员管理-参赛资格审核主键
     * @return 运动员管理-参赛资格审核
     */
    public SportsAthleteEligibilityReview selectSportsAthleteEligibilityReviewById(Long id);

    /**
     * 查询运动员管理-参赛资格审核列表
     * 
     * @param sportsAthleteEligibilityReview 运动员管理-参赛资格审核
     * @return 运动员管理-参赛资格审核集合
     */
    public List<SportsAthleteEligibilityReview> selectSportsAthleteEligibilityReviewList(SportsAthleteEligibilityReview sportsAthleteEligibilityReview);

    /**
     * 新增运动员管理-参赛资格审核
     * 
     * @param sportsAthleteEligibilityReview 运动员管理-参赛资格审核
     * @return 结果
     */
    public int insertSportsAthleteEligibilityReview(SportsAthleteEligibilityReview sportsAthleteEligibilityReview);

    /**
     * 修改运动员管理-参赛资格审核
     * 
     * @param sportsAthleteEligibilityReview 运动员管理-参赛资格审核
     * @return 结果
     */
    public int updateSportsAthleteEligibilityReview(SportsAthleteEligibilityReview sportsAthleteEligibilityReview);

    /**
     * 批量删除运动员管理-参赛资格审核
     * 
     * @param ids 需要删除的运动员管理-参赛资格审核主键集合
     * @return 结果
     */
    public int deleteSportsAthleteEligibilityReviewByIds(Long[] ids);

    /**
     * 删除运动员管理-参赛资格审核信息
     * 
     * @param id 运动员管理-参赛资格审核主键
     * @return 结果
     */
    public int deleteSportsAthleteEligibilityReviewById(Long id);
}
