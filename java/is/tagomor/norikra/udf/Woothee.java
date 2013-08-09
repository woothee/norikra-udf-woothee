package is.tagomor.norikra.udf;

import is.tagomor.woothee.Classifier;
import is.tagomor.woothee.DataSet;

import java.util.Map;
import java.util.List;

public final class Woothee
{
  public static Map<String,String> parseAgent(final String agent) {
    return Classifier.parse(agent);
  }

  public static Boolean isPC(final Map<String,String> m) {
    return m.get(DataSet.ATTRIBUTE_CATEGORY).equals(DataSet.DATASET_CATEGORY_PC);
  }

  public static Boolean isSmartPhone(final Map<String,String> m) {
    return m.get(DataSet.ATTRIBUTE_CATEGORY).equals(DataSet.DATASET_CATEGORY_SMARTPHONE);
  }

  public static Boolean isMobilePhone(final Map<String,String> m) {
    return m.get(DataSet.ATTRIBUTE_CATEGORY).equals(DataSet.DATASET_CATEGORY_MOBILEPHONE);
  }

  public static Boolean isAppliance(final Map<String,String> m) {
    return m.get(DataSet.ATTRIBUTE_CATEGORY).equals(DataSet.DATASET_CATEGORY_APPLIANCE);
  }

  public static Boolean isMisc(final Map<String,String> m) {
    return m.get(DataSet.ATTRIBUTE_CATEGORY).equals(DataSet.DATASET_CATEGORY_MISC);
  }

  public static Boolean isCrawler(final Map<String,String> m) {
    return m.get(DataSet.ATTRIBUTE_CATEGORY).equals(DataSet.DATASET_CATEGORY_CRAWLER);
  }

  public static Boolean isUnknown(final Map<String,String> m) {
    return m.get(DataSet.ATTRIBUTE_CATEGORY).equals(DataSet.VALUE_UNKNOWN);
  }

  public static Boolean isIn(final Map<String,String> m, final List<String> categories) {
    String targetCategory = m.get(DataSet.ATTRIBUTE_CATEGORY);
    for (String c : categories) {
      if (targetCategory.equals(c))
        return Boolean.TRUE;
    }
    return Boolean.FALSE;
  }
}
