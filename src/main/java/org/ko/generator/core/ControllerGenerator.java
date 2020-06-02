package org.ko.generator.core;

import freemarker.template.Template;
import org.apache.commons.lang3.StringUtils;
import org.ko.generator.entity.Column;
import org.springframework.stereotype.Component;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;

/**
 * description: ControllerGenerator <br>
 * date: 2020/5/29 23:41 <br>
 *
 * @author K.O <br>
 * @version 1.0 <br>
 */
@Component
public class ControllerGenerator extends AbstractGenerator {

    private static final String CONTROLLER_PACKAGE = "/Controllers/Api/V1/Report/";

    @Override
    public void executor(String... names) throws Exception {
        for (String name : names) {
            //表名字
            String entityName = reformatTable(name, properties.getPrefix());

            //全部字段
            List<Column> columns = findColumnByTableName(name);

            HashMap<String, Object> params = new HashMap<>();
            params.put("name", name);
            params.put("entityName", entityName);
            params.put("columns", columns);

            String path = properties.getPath() + CONTROLLER_PACKAGE;

            String controllerFileName = path + entityName + "Controller.cs";

            if (StringUtils.isNotEmpty(controllerFileName)) {
                File dir = new File(path);
                if (!dir.exists()) dir.mkdirs();
                Template template = freemarker.getTemplate(properties.getBackEnd().getControllerTemplate());
                OutputStreamWriter out = new OutputStreamWriter(new FileOutputStream(
                        new File(controllerFileName)), StandardCharsets.UTF_8);
                template.process(params, out);
                out.close();
            }
        }
    }
}
