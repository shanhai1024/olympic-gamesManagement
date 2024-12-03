package com.neuedu.sports.mapper;

import java.util.List;
import com.neuedu.sports.domain.SportsCrisisResponse;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
/**
 * 安全与健康协议-危机响应Mapper接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Mapper
public interface SportsCrisisResponseMapper extends BaseMapper<SportsCrisisResponse>
{
    /**
     * 查询安全与健康协议-危机响应
     * 
     * @param id 安全与健康协议-危机响应主键
     * @return 安全与健康协议-危机响应
     */
    public SportsCrisisResponse selectSportsCrisisResponseById(Long id);

    /**
     * 查询安全与健康协议-危机响应列表
     * 
     * @param sportsCrisisResponse 安全与健康协议-危机响应
     * @return 安全与健康协议-危机响应集合
     */
    public List<SportsCrisisResponse> selectSportsCrisisResponseList(SportsCrisisResponse sportsCrisisResponse);

    /**
     * 新增安全与健康协议-危机响应
     * 
     * @param sportsCrisisResponse 安全与健康协议-危机响应
     * @return 结果
     */
    public int insertSportsCrisisResponse(SportsCrisisResponse sportsCrisisResponse);

    /**
     * 修改安全与健康协议-危机响应
     * 
     * @param sportsCrisisResponse 安全与健康协议-危机响应
     * @return 结果
     */
    public int updateSportsCrisisResponse(SportsCrisisResponse sportsCrisisResponse);

    /**
     * 删除安全与健康协议-危机响应
     * 
     * @param id 安全与健康协议-危机响应主键
     * @return 结果
     */
    public int deleteSportsCrisisResponseById(Long id);

    /**
     * 批量删除安全与健康协议-危机响应
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSportsCrisisResponseByIds(Long[] ids);
}
