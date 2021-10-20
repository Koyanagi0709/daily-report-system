package controllers;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Message;
import utils.DBUtil;

/**
 * Servlet implementation class InquiryServlet
 */
@WebServlet("/InquiryServlet")
public class InquiryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // リクエストパラメータを取得する
//        EntityManager em = DBUtil.createEntityManager();
//
//        // 開くページ数を取得（デフォルトは1ページ目）
//           int page = 1;
//           try {
//               page = Integer.parseInt(request.getParameter("page"));
//           } catch(NumberFormatException e) {}
//
//           // 最大件数と開始位置を指定してメッセージを取得
//           List<Message> messages = em.createNamedQuery("getAllMessages", Message.class)
//                                      .setFirstResult(15 * (page - 1))
//                                      .setMaxResults(15)
//                                      .getResultList();
//
//           // 全件数を取得
//           long messages_count = (long)em.createNamedQuery("getMessagesCount", Long.class)
//                                         .getSingleResult();
//
//           em.close();
//
//           request.setAttribute("messages", messages);
//           request.setAttribute("messages_count", messages_count);     // 全件数
//           request.setAttribute("page", page);                         // ページ数

        String title = request.getParameter("title");
        String content = request.getParameter("content");


//        String content  = request.getParameter("content");

        // 入力項目チェック (バリデーション)
        List<String> errors = new ArrayList<String>();

        if(title == null || title.equals("")) { /* 氏名 */
            errors.add("氏名を入力してください");
        }
        if(content == null || content.equals("")) { /* メールアドレス */
            errors.add("メールアドレスを入力してください");
        }
//        if(content == null || content.equals("")) { /* お問い合わせ内容 */
//            errors.add("お問い合わせ内容を入力してください");
//        }

        // 入力内容にエラーがあったかどうか
        if(errors.size() > 0) {
            // JSPにエラー内容を送る
            request.setAttribute("errors", errors);
        } else {
            // JSPに入力データを送る
            request.setAttribute("title", title);
            request.setAttribute("content", content);
//            request.setAttribute("content", content);
        }

        EntityManager em = DBUtil.createEntityManager();
        em.getTransaction().begin();

        Message m = new Message();

        m.setTitle(title);

        m.setContent(content);

        Timestamp currentTime = new Timestamp(System.currentTimeMillis());
        m.setCreated_at(currentTime);
        m.setUpdated_at(currentTime);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String timeStr = sdf.format(currentTime);
     // データベースに保存
        em.persist(m);
        em.getTransaction().commit();
        //request.getSession().setAttribute("flush", "登録が完了しました。");
        em.close();


        // JSPに値を送る
        request.setAttribute("title", title);
        request.setAttribute("timeStr", timeStr);
        request.setAttribute("content", content);
//        request.setAttribute("content", content);



        // ビューとなるJSPを指定して表示する
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/topPage/time.jsp");
        rd.forward(request, response);
    }
}
