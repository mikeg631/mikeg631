import java.lang.Exception;
import org.antlr.v4.runtime.ANTLRFileStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

public class Main {

    public static void main(String[] args) throws Exception {

        BCLexer lexer = new BCLexer(new ANTLRFileStream(args[0]));
        BCParser parser = new BCParser(new CommonTokenStream(lexer));
        BCParser.StatementsContext tree = parser.statements();
        EvalVisitor visitor = new EvalVisitor();
        visitor.visitStatements(tree);
    }
}