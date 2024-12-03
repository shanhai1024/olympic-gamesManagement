package com.neuedu.accommodation.mapper;

import java.util.List;
import com.neuedu.accommodation.domain.SportsAccommodationArrangement;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
/**
 * 住宿安排Mapper接口
 * 
 * @author ruoyi
 * @date 2024-11-12
 */
@Mapper
public interface SportsAccommodationArrangementMapper extends BaseMapper<SportsAccommodationArrangement>
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
     * 删除住宿安排
     * 
     * @param id 住宿安排主键
     * @return 结果
     */
    public int deleteSportsAccommodationArrangementById(Long id);

    /**
     * 批量删除住宿安排
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSportsAccommodationArrangementByIds(Long[] ids);
}
