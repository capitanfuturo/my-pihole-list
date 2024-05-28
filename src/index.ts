import fs from 'fs';
import readline from 'readline';
import events from 'events';

const inputFileName = "adlist.txt";
const outputFileName = "list.txt";

async function init(): Promise<void> {

    const list = new Set<string>();

    try {
        console.log("Started!");
        const rl = readline.createInterface({
            input: fs.createReadStream(inputFileName),
            crlfDelay: Infinity
        });

        rl.on('line', (line) => {
            const result = processLine(line);
            list.add(result);
        });

        await events.once(rl, 'close');
        //TODO
        var file = fs.createWriteStream(outputFileName);
        list.forEach(function (v) { file.write(v + '\n'); });
        file.end();

        console.log("Finished!");
    } catch (err) {
        console.error(err);
    }
}

function processLine(line: string): string {
    let result = line;

    if (result.startsWith("#0.0.0.0")) {
        result = result.replace("#0.0.0.0", "");
    }
    if (result.startsWith("0.0.0.0")) {
        result = result.replace("0.0.0.0", "");
    }

    if (result.startsWith("#127.0.0.1")) {
        result = result.replace("#127.0.0.1", "");
    }
    if (result.startsWith("127.0.0.1")) {
        result = result.replace("127.0.0.1", "");
    }

    if (result.startsWith("@@||")) {
        result = result.replace("@@||", "||");
    }


    /* MANIPULATE */
    // es: ~vsesdal.com##a[href*="://vsesdal.com/promo/"]
    if (result.startsWith("~")) {
        result = result.replace("~", "");
        let index = result.indexOf("#");
        if (index > -1) {
            result = result.substring(0, index);
        }

        // es: ~vsv.be,~umicore.com,~rodekruis.be,~veiligverkeer.be,~workshopsveiligverkeer.be
        index = result.indexOf("~");
        if (index > -1) {
            result = result.substring(0, index);
        }


        // es: ~wirtualnemedia.pl,~footroll.pl,~shinden.pl##body>div[class^="app_gdpr"]
        index = result.indexOf(",");
        if (index > -1) {
            result = result.substring(0, index);
        }

        return result;
    }

    // es: ||zytpirwai.net^$third-party or ||zzbaike.com/sites/all/themes/zzbaike/images/
    if (result.startsWith("||")) {
        result = result.replace("||", "");

        // es: ||zytpirwai.net^$third-party
        let index = result.indexOf("^");
        if (index > 0) {
            result = result.substring(0, index);
        }

        // es: ||zzbaike.com/sites/all/themes/zzbaike/images/
        index = result.indexOf("/");
        if (index > 0) {
            result = result.substring(0, index);
        }
        return result;
    }

    /* FINAL CLEANUP */
    if (result.indexOf("#") > 0) {
        result = result.substring(0, result.indexOf("#"));
    }
    if (result.indexOf(",") > 0) {
        result = result.substring(0, result.indexOf(","));
    }

    // es: window-close.$image,third-party
    if (result.includes(".$image") ||
        result.includes(".$popup")) {
        return "";
    }

    //es: /wp-content/plugins/shapepress-dsgvo/*
    if (result.startsWith("!") ||
        result.startsWith("#") ||
        result.startsWith(".") ||
        result.startsWith("&") ||
        result.startsWith("-") ||
        result.startsWith("%") ||
        result.startsWith("/") ||
        result.startsWith("$") ||
        result.startsWith("]") ||
        result.startsWith("|") ||
        result.startsWith("*") ||
        result.startsWith("^") ||
        result.startsWith("_") ||
        result.startsWith("[")) {
        return "";
    }



    return result;
}

init();