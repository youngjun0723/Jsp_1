package ch09;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class OracleMgr {

    private DBConnectionMgr2 pool;

    public OracleMgr() {
        pool = DBConnectionMgr2.getInstance();
    }

    public int getOrdersCount() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        int count = 0;
        try{
            con = pool.getConnection();
            sql = "select count(*) from orders";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if(rs.next()) count = rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return count;
    }

    public static void main(String[] args) {
        OracleMgr mgr = new OracleMgr();
        System.out.println(mgr.getOrdersCount());
    }
}
