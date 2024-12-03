package com.neuedu.accommodation.service;

import java.util.List;
import com.neuedu.accommodation.domain.SportsAccommodationArrangement;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 住宿安排Service接口
 * 
 * @author ruoyi
 * @date 2024-11-12
 */
public interface ISportsAccommodationArrangementService extends IService<SportsAccommodationArrangement>
{
    /**
     * 查询住宿安排
     * 
     * @param id 住宿安排主键
     * @return 住宿安排
     */
    public SportsAccommodationArrangement selectSportsAccommodationArrangementById(Long id);

    /**
     * 查询住宿安排列表
     * 
     * @param sportsAccommodationArrangement 住宿安排
     * @return 住宿安排集合
     */
    public List<SportsAccommodationArrangement> selectSportsAccommodationArrangementList(SportsAccommodationArrangement sportsAccommodationArrangement);

    /**
     * 新增住宿安排
     * 
     * @param sportsAccommodationArrangement 住宿安排
     * @return 结果
     */
    public int insertSportsAccommodationArrangement(SportsAccommodationArrangement sportsAccommodationArrangement);

    /**
     * 修改住宿安排
     * 
     * @param sportsAccommodationArrangement 住宿安排
     * @return 结果
     */
    public int updateSportsAccommodationArrangement(SportsAccommodationArrangement sportsAccommodationArrangement);

    /**
     * 批量删除住宿安排
     * 
     * @param ids 需要删除的住宿安排主键集合
     * @return 结果
     */
    public int deleteSportsAccommodationArrangementByIds(Long[] ids);

    /**
     * 删除住宿安排信息
     * 
     * @param id 住宿安排主键
     * @return 结果
     */
    public int deleteSportsAccommodationArrangementById(Long id);
}
