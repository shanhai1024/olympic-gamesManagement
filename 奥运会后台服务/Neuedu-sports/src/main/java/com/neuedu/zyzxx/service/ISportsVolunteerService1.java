package com.neuedu.zyzxx.service;

import java.util.List;
import com.neuedu.zyzxx.domain.SportsVolunteer1;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 志愿者信息中心Service接口
 *
 * @author ruoyi
 * @date 2024-11-12
 */
public interface ISportsVolunteerService1 extends IService<SportsVolunteer1>
{
    /**
     * 查询志愿者信息中心
     *
     * @param id 志愿者信息中心主键
     * @return 志愿者信息中心
     */
    public SportsVolunteer1 selectSportsVolunteerById(Long id);

    /**
     * 查询志愿者信息中心列表
     *
     * @param sportsVolunteer 志愿者信息中心
     * @return 志愿者信息中心集合
     */
    public List<SportsVolunteer1> selectSportsVolunteerList(SportsVolunteer1 sportsVolunteer);

    /**
     * 新增志愿者信息中心
     *
     * @param sportsVolunteer 志愿者信息中心
     * @return 结果
     */
    public int insertSportsVolunteer(SportsVolunteer1 sportsVolunteer);

    /**
     * 修改志愿者信息中心
     *
     * @param sportsVolunteer 志愿者信息中心
     * @return 结果
     */
    public int updateSportsVolunteer(SportsVolunteer1 sportsVolunteer);

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
