package ca.uqam.data.translator.xmltojson;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.net.URI;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;

import org.apache.commons.io.IOUtils;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.XML;



import picocli.CommandLine;
@CommandLine.Command(name = "XML2JSON")
public class XML2JSON {
    public static int PRETTY_PRINT_INDENT_FACTOR = 4;

    public static void main(String[] args) throws IOException {
        XML2JSON xml2json = new XML2JSON(System.in, System.out);

        try
        {
            CommandLine.ParseResult parseResult = new CommandLine(xml2json).parseArgs(args);
            if (!CommandLine.printHelpIfRequested(parseResult)) xml2json.convert();
        }
        catch (CommandLine.ParameterException ex)
        { // command line arguments could not be parsed
            System.err.println(ex.getMessage());
            ex.getCommandLine().usage(System.err);
        }
    }
    private final InputStream xmlIn;
    private final OutputStream jsonOut;

    @CommandLine.Option(names = { "--input-charset" }, description = "Input charset (default: ${DEFAULT-VALUE})")
    private static Charset inputCharset = StandardCharsets.UTF_8;

    @CommandLine.Option(names = { "--output-charset" }, description = "Output charset (default: ${DEFAULT-VALUE})")
    private Charset outputCharset = StandardCharsets.UTF_8;
    public XML2JSON(InputStream xmlIn, OutputStream jsonOut)
    {
        this.xmlIn = xmlIn;
        this.jsonOut = jsonOut;
    }
    public void convert() throws IOException
    {
        if (xmlIn.available() == 0) throw new IllegalStateException("JSON input not provided");
        try (Reader reader =  new BufferedReader(new InputStreamReader(xmlIn, inputCharset)))
        {
            JSONObject xmlJSONObj = XML.toJSONObject(new InputStreamReader(xmlIn));
            String jsonPrettyPrintString = xmlJSONObj.toString(PRETTY_PRINT_INDENT_FACTOR);
            IOUtils.write(jsonPrettyPrintString, jsonOut, "UTF-8");
            
        }
    }
    public static String convert(String xml) throws IOException
    {		
    	InputStream _xmlIn = new ByteArrayInputStream(xml.getBytes(inputCharset));
        String jsonPrettyPrintString;
		try (Reader reader =  new BufferedReader(new InputStreamReader(_xmlIn, inputCharset)))
        {
            JSONObject xmlJSONObj = XML.toJSONObject(new InputStreamReader(_xmlIn));
            jsonPrettyPrintString = xmlJSONObj.toString();
        }
		return jsonPrettyPrintString;
    }
}
