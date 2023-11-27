package zijie.dao;

import zijie.model.Card;
import zijie.util.ConnectionMysql;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CardDao {
    public static Card selectByID(int idcard) {
        ConnectionMysql connectionMysql = new ConnectionMysql();
        String sql = "select * from card where "+idcard+" = idcard";
        ResultSet resultSet = connectionMysql.select(sql);
        try {
            if (resultSet.next()) {
                Card card = new Card(resultSet.getInt("idcard"), resultSet.getInt("balance"), resultSet.getInt("user_iduser"));
                return card;
            }
            else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static Card selectByUserID(int iduser) {
        ConnectionMysql connectionMysql = new ConnectionMysql();
        String sql = "select * from card where "+iduser+" = user_iduser";
        ResultSet resultSet = connectionMysql.select(sql);
        try {
            if (resultSet.next()) {
                Card card = new Card(resultSet.getInt("idcard"), resultSet.getInt("balance"), resultSet.getInt("user_iduser"));
                return card;
            }
            else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static int update(Card card) {
        ConnectionMysql connectionMysql = new ConnectionMysql();
        String sql = "update card set balance = "+card.balance+" where idcard = "+card.idcard;
        return connectionMysql.update(sql);
    }

    public static int delete(Card findingCard) {
        ConnectionMysql connectionMysql = new ConnectionMysql();
        String sql = "delete from card where idcard = "+findingCard.idcard;
        return connectionMysql.update(sql);
    }
}
