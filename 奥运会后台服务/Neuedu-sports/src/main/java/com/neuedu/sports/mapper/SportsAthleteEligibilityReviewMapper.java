package com.neuedu.sports.mapper;

import java.util.List;
import com.neuedu.sports.domain.SportsAthleteEligibilityReview;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
/**
 * 运动员管理-参赛资格审核Mapper接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Mapper
public interface SportsAthleteEligibilityReviewMapper extends BaseMapper<SportsAthleteEligibilityReview>
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
     * 删除运动员管理-参赛资格审核
     * 
     * @param id 运动员管理-参赛资格审核主键
     * @return 结果
     */
    public int deleteSportsAthleteEligibilityReviewById(Long id);

    /**
     * 批量删除运动员管理-参赛资格审核
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSportsAthleteEligibilityReviewByIds(Long[] ids);
}
