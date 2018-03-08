package org.angeleyes.dao;

import org.apache.ibatis.annotations.Param;

/**
 * 通用方法Dao
 */
public interface CommonDao {
    /**
     * 删除表中某条记录
     * @param tableName 表名
     * @param rowId     记录ID
     * @return
     */
    int deleteOne(@Param("tableName") String tableName,
                  @Param("rowName") String rowName,
                  @Param("rowId") long rowId);
}
