import java.awt.*;
import java.awt.geom.*;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;
import java.io.File;

// draws the 320x180 tv banner + launcher icon, run: java tools/MakeArt.java
public class MakeArt {
    public static void main(String[] a) throws Exception {
        BufferedImage ban = new BufferedImage(320, 180, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g = prep(ban);
        g.setPaint(new GradientPaint(0, 0, new Color(28, 34, 52), 320, 180, new Color(12, 14, 20)));
        g.fillRect(0, 0, 320, 180);
        globe(g, 72, 90, 44);
        g.setColor(Color.WHITE);
        g.setFont(new Font("SansSerif", Font.BOLD, 40));
        g.drawString("Websites", 130, 104);
        g.dispose();
        ImageIO.write(ban, "png", new File("res/drawable-nodpi/banner.png"));

        BufferedImage ic = new BufferedImage(96, 96, BufferedImage.TYPE_INT_ARGB);
        g = prep(ic);
        g.setColor(new Color(28, 34, 52));
        g.fill(new RoundRectangle2D.Double(0, 0, 96, 96, 24, 24));
        globe(g, 48, 48, 32);
        g.dispose();
        ImageIO.write(ic, "png", new File("res/mipmap-xhdpi/ic_launcher.png"));
        System.out.println("art done");
    }

    static Graphics2D prep(BufferedImage img) {
        Graphics2D g = img.createGraphics();
        g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        g.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);
        return g;
    }

    // simple line globe
    static void globe(Graphics2D g, int cx, int cy, int r) {
        g.setColor(new Color(110, 190, 255));
        g.setStroke(new BasicStroke(Math.max(3f, r / 11f)));
        g.draw(new Ellipse2D.Double(cx - r, cy - r, 2 * r, 2 * r));
        g.draw(new Ellipse2D.Double(cx - r * 0.45, cy - r, r * 0.9, 2 * r));
        g.draw(new Line2D.Double(cx, cy - r, cx, cy + r));
        g.draw(new Line2D.Double(cx - r, cy, cx + r, cy));
        double y = r * 0.5, w = Math.sqrt(r * r - y * y);
        g.draw(new Line2D.Double(cx - w, cy - y, cx + w, cy - y));
        g.draw(new Line2D.Double(cx - w, cy + y, cx + w, cy + y));
    }
}
