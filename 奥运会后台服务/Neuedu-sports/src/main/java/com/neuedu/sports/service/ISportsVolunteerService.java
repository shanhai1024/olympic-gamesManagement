package com.neuedu.sports.service;

import java.util.List;
import com.neuedu.sports.domain.SportsVolunteer;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 志愿者信息中心Service接口
 * 
 * @author neuedu
 * @date 2024-06-13
 */
public interface ISportsVolunteerService extends IService<SportsVolunteer>
{
    /**
     * 查询志愿者信息中心
     * 
     * @param id 志愿者信息中心主键
     * @return 志愿者信息中心
     */
    public SportsVolunteer selectSportsVolunteerById(Long id);

    /**
     * 查询志愿者信息中心列表
     * 
     * @param sportsVolunteer 志愿者信息中心
     * @return 志愿者信息中心集合
     */
    public List<SportsVolunteer> selectSportsVolunteerList(SportsVolunteer sportsVolunteer);

    /**
     * 新增志愿者信息中心
     * 
     * @param sportsVolunteer 志愿者信息中心
     * @return 结果
     */
    public int insertSportsVolunteer(SportsVolunteer sportsVolunteer);

    /**
     * 修改志愿者信息中心
     * 
     * @param sportsVolunteer 志愿者信息中心
     * @return 结果
     */
    public int updateSportsVolunteer(SportsVolunteer sportsVolunteer);

    /**
     * 批量删除志愿者信息中心
     * 
     * @param ids 需要删除的志愿者信息中心主键集合
     * @return 结果
     */
    public int deleteSportsVolunteerByIds(Long[] ids);

    /**
     * 删除志愿者信息中心信息
     * 
     * @param id 志愿者信息中心主键
     * @return 结果
     */
    public int deleteSportsVolunteerById(Long id);
}
