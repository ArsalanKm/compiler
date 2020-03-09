

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;


public class Main {


    private static final String HEAD = "<!DOCTYPE html>" + "<html lang=\"en\">" + "<head>" + "<meta charset=\"UTF-8\">" + "<title>Title</title>" + "</head>" + "<body>";

    private static final String END = "</body>\n</html>";

    public static void main(String[] args) throws IOException {
        Scanner scanner = new Scanner(new FileReader("C:\\Users\\ASUS\\IdeaProjects\\compiler\\src\\test.txt"));
        StringBuilder html = new StringBuilder(HEAD);
        while (true) {
            Symbol a = scanner.myscanner();
            if (a == null)
                break;
            html.append(scanner.stringBuilder);

        }

        html.append(END);
        Document doc = Jsoup.parse(String.valueOf(html));


        FileWriter fileWriter = new FileWriter("scanned.html");
        fileWriter.write(doc.toString());
        fileWriter.flush();
        fileWriter.close();

        System.out.println("Finished scanning");
    }
}
