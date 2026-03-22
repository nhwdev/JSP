package controller;

import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

@WebServlet(urlPatterns = {"/ajax/*"}, initParams = {@WebInitParam(name = "view", value = "/view/")})
public class AjaxController extends MskimRequestMapping {
    @RequestMapping("select")
    public String select(HttpServletRequest request, HttpServletResponse response) {
        BufferedReader fr = null;
        String path = request.getServletContext().getRealPath("/") + "file/sido.txt";
        try {
            fr = new BufferedReader(new FileReader(path));
        } catch (IOException e) {
            e.printStackTrace();
        }
        // LinkedHashSet : 중복불가, 순서유지
        Set<String> set = new LinkedHashSet<>(); // { 서울특별시, 부산광역시}
        String data = null;
        String si = request.getParameter("si");
        String gu = request.getParameter("gu");
        if (si == null && gu == null) { // 시도 목록 조회. 초기값
            try {
                // data : 서울특별시 종로구 종로동
                while ((data = fr.readLine()) != null) {
                    String[] arr = data.split("\\s+"); // \\s+ : 정규식 \s(공백) + : 1개이상
                    // arr : [서울특별시, 종로구, 종로동]
                    if (arr.length >= 3) set.add(arr[0].trim());
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else if (gu == null) {
            si = si.trim();
            try {
                while ((data = fr.readLine()) != null) {
                    String[] arr = data.split("\\s+");
                    if (arr.length >= 3 && arr[0].equals(si) && !arr[1].contains(arr[0])) {
                        set.add(arr[1].trim());
                    }
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else if (si != null && gu != null) {
            si = si.trim();
            gu = gu.trim();
            try {
                while ((data = fr.readLine()) != null) {
                    String[] arr = data.split("\\s+");
                    if (arr.length >= 3 && arr[0].equals(si) && arr[1].equals(gu) && !arr[1].contains(arr[0]) && !arr[2].contains(arr[1])) {
                        if (arr.length > 3) {
                            if (arr[3].contains(arr[1])) continue;
                            arr[2] += " " + arr[3];
                        }
                        set.add(arr[2].trim());
                    }
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        request.setAttribute("list", new ArrayList<String>(set));
        request.setAttribute("len", set.size());
        return "ajax/select";
    }

    @RequestMapping("exchange")
    public String exchange(HttpServletRequest request, HttpServletResponse response) {
        Document doc = null;
        List<List<String>> trlist = new ArrayList<>();
        String url = "https://www.koreaexim.go.kr/wg/HPHKWG057M01";
        String exdate = null;
        try {
            doc = Jsoup.connect(url).get();
            Elements trs = doc.select("tr"); // tr 태그들
            exdate = doc.select("p.table-unit").html(); // 날짜정보 조회 기준일 : 2026.03.20
            for (Element tr : trs) {
                List<String> tdlist = new ArrayList<>();
                // tds : td 태그들
                Elements tds = tr.select("td");
                for (Element td : tds) {
                    tdlist.add(td.html());
                }
                if (tdlist.size() > 0) {
                    // 0 : 통화코드
                    if (tdlist.get(0).equals("USD") || tdlist.get(0).equals("CNH") || tdlist.get(0).equals("JPY(100)") || tdlist.get(0).equals("EUR")) {
                        trlist.add(tdlist); // USD, CNH, JPY, EUR 통화의 td 정보들만 저장
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        request.setAttribute("date", exdate);
        request.setAttribute("list", trlist);
        return "ajax/exchange";
    }

    @RequestMapping("logo")
    public String logo(HttpServletRequest request, HttpServletResponse response) {
        try {
            Document doc = Jsoup.connect("https://www.gudi.kr")
                    .get();
            String img = doc.select(".front_img img").attr("src");
            request.setAttribute("img", img);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("hi");
        return "ajax/logo";
    }
}