module SpecUtils
  

  def food_database_path
    Edamam::Utils::Api::BASE_URL + Edamam::Utils::Api::FOOD_DATABASE_URL
  end

  def app_key
    "ts_a530b7c17f2aee6c47101a67xxxxxxxx"
  end
  def app_id
    "ts_4f5fxxxx"
  end

  def wrong_credentials
    "?app_id=#{app_id + "invalid"}&app_key=#{app_key}"
  end

  def correct_credentials
    "?app_id=#{app_id}&app_key=#{app_key}"
  end

  def ingredient
    "&ingr=1%20large%20chicken"
  end

  RESPONSE = {
    "calories": 520,
    "totalWeight": 1000,
    "dietLabels": [],
    "healthLabels": [],
    "cautions": [],
    "totalNutrients": {
      "ENERC_KCAL": {
        "label": "Energy",
        "quantity": 520,
        "unit": "kcal"
      },
      "FAT": {
        "label": "Fat",
        "quantity": 1.7000000000000002,
        "unit": "g"
      },
      "FASAT": {
        "label": "Saturated",
        "quantity": 0.28,
        "unit": "g"
      },
      "FAMS": {
        "label": "Monounsaturated",
        "quantity": 0.07,
        "unit": "g"
      },
      "FAPU": {
        "label": "Polyunsaturated",
        "quantity": 0.51,
        "unit": "g"
      },
      "CHOCDF": {
        "label": "Carbs",
        "quantity": 138.1,
        "unit": "g"
      },
      "FIBTG": {
        "label": "Fiber",
        "quantity": 24,
        "unit": "g"
      },
      "SUGAR": {
        "label": "Sugars",
        "quantity": 103.9,
        "unit": "g"
      },
      "PROCNT": {
        "label": "Protein",
        "quantity": 2.6,
        "unit": "g"
      },
      "NA": {
        "label": "Sodium",
        "quantity": 10,
        "unit": "mg"
      },
      "CA": {
        "label": "Calcium",
        "quantity": 60,
        "unit": "mg"
      },
      "MG": {
        "label": "Magnesium",
        "quantity": 50,
        "unit": "mg"
      },
      "K": {
        "label": "Potassium",
        "quantity": 1070,
        "unit": "mg"
      },
      "FE": {
        "label": "Iron",
        "quantity": 1.2,
        "unit": "mg"
      },
      "ZN": {
        "label": "Zinc",
        "quantity": 0.4,
        "unit": "mg"
      },
      "P": {
        "label": "Phosphorus",
        "quantity": 110,
        "unit": "mg"
      },
      "VITA_RAE": {
        "label": "Vitamin A",
        "quantity": 30,
        "unit": "µg"
      },
      "VITC": {
        "label": "Vitamin C",
        "quantity": 46,
        "unit": "mg"
      },
      "THIA": {
        "label": "Thiamin (B1)",
        "quantity": 0.17,
        "unit": "mg"
      },
      "RIBF": {
        "label": "Riboflavin (B2)",
        "quantity": 0.26,
        "unit": "mg"
      },
      "NIA": {
        "label": "Niacin (B3)",
        "quantity": 0.9099999999999999,
        "unit": "mg"
      },
      "VITB6A": {
        "label": "Vitamin B6",
        "quantity": 0.41000000000000003,
        "unit": "mg"
      },
      "FOLDFE": {
        "label": "Folate (Equivalent)",
        "quantity": 30,
        "unit": "µg"
      },
      "TOCPHA": {
        "label": "Vitamin E",
        "quantity": 1.7999999999999998,
        "unit": "mg"
      },
      "VITK1": {
        "label": "Vitamin K",
        "quantity": 22,
        "unit": "µg"
      }
    },
    "totalDaily": {
      "ENERC_KCAL": {
        "label": "Energy",
        "quantity": 26,
        "unit": "%"
      },
      "FAT": {
        "label": "Fat",
        "quantity": 2.615384615384616,
        "unit": "%"
      },
      "FASAT": {
        "label": "Saturated",
        "quantity": 1.4000000000000001,
        "unit": "%"
      },
      "CHOCDF": {
        "label": "Carbs",
        "quantity": 46.03333333333333,
        "unit": "%"
      },
      "FIBTG": {
        "label": "Fiber",
        "quantity": 96,
        "unit": "%"
      },
      "PROCNT": {
        "label": "Protein",
        "quantity": 5.2,
        "unit": "%"
      },
      "NA": {
        "label": "Sodium",
        "quantity": 0.4166666666666667,
        "unit": "%"
      },
      "CA": {
        "label": "Calcium",
        "quantity": 6,
        "unit": "%"
      },
      "MG": {
        "label": "Magnesium",
        "quantity": 12.5,
        "unit": "%"
      },
      "K": {
        "label": "Potassium",
        "quantity": 30.571428571428573,
        "unit": "%"
      },
      "FE": {
        "label": "Iron",
        "quantity": 6.666666666666667,
        "unit": "%"
      },
      "ZN": {
        "label": "Zinc",
        "quantity": 2.6666666666666665,
        "unit": "%"
      },
      "P": {
        "label": "Phosphorus",
        "quantity": 15.714285714285714,
        "unit": "%"
      },
      "VITA_RAE": {
        "label": "Vitamin A",
        "quantity": 3.3333333333333335,
        "unit": "%"
      },
      "VITC": {
        "label": "Vitamin C",
        "quantity": 76.66666666666667,
        "unit": "%"
      },
      "THIA": {
        "label": "Thiamin (B1)",
        "quantity": 11.333333333333334,
        "unit": "%"
      },
      "RIBF": {
        "label": "Riboflavin (B2)",
        "quantity": 15.294117647058824,
        "unit": "%"
      },
      "NIA": {
        "label": "Niacin (B3)",
        "quantity": 4.549999999999999,
        "unit": "%"
      },
      "VITB6A": {
        "label": "Vitamin B6",
        "quantity": 20.5,
        "unit": "%"
      },
      "FOLDFE": {
        "label": "Folate (Equivalent)",
        "quantity": 7.5,
        "unit": "%"
      },
      "TOCPHA": {
        "label": "Vitamin E",
        "quantity": 8.999999999999998,
        "unit": "%"
      },
      "VITK1": {
        "label": "Vitamin K",
        "quantity": 27.5,
        "unit": "%"
      }
    },
    "ingredients": [
      {
        "text": "1 kg apple",
        "parsed": [
          {
            "quantity": 1,
            "measure": "kilogram",
            "foodMatch": "apple",
            "food": "Apples, raw, with skin",
            "foodId": "Food_09003",
            "foodURI": "http://www.edamam.com/ontologies/edamam.owl#Food_09003",
            "weight": 1000,
            "retainedWeight": 1000,
            "nutrients": {
              "PROCNT": {
                "label": "Protein",
                "quantity": 2.6,
                "unit": "g"
              },
              "FAT": {
                "label": "Total lipid (fat)",
                "quantity": 1.7,
                "unit": "g"
              },
              "CHOCDF": {
                "label": "Carbohydrate, by difference",
                "quantity": 138.1,
                "unit": "g"
              },
              "ENERC_KCAL": {
                "label": "Energy",
                "quantity": 520,
                "unit": "kcal"
              },
              "SUGAR": {
                "label": "Sugars, total",
                "quantity": 103.9,
                "unit": "g"
              },
              "FIBTG": {
                "label": "Fiber, total dietary",
                "quantity": 24,
                "unit": "g"
              },
              "CA": {
                "label": "Calcium, Ca",
                "quantity": 60,
                "unit": "mg"
              },
              "FE": {
                "label": "Iron, Fe",
                "quantity": 1.2,
                "unit": "mg"
              },
              "MG": {
                "label": "Magnesium, Mg",
                "quantity": 50,
                "unit": "mg"
              },
              "P": {
                "label": "Phosphorus, P",
                "quantity": 110,
                "unit": "mg"
              },
              "K": {
                "label": "Potassium, K",
                "quantity": 1070,
                "unit": "mg"
              },
              "NA": {
                "label": "Sodium, Na",
                "quantity": 10,
                "unit": "mg"
              },
              "ZN": {
                "label": "Zinc, Zn",
                "quantity": 0.4,
                "unit": "mg"
              },
              "VITA_RAE": {
                "label": "Vitamin A, RAE",
                "quantity": 30,
                "unit": "µg"
              },
              "TOCPHA": {
                "label": "Vitamin E (alpha-tocopherol)",
                "quantity": 1.8,
                "unit": "mg"
              },
              "VITC": {
                "label": "Vitamin C, total ascorbic acid",
                "quantity": 46,
                "unit": "mg"
              },
              "THIA": {
                "label": "Thiamin",
                "quantity": 0.17,
                "unit": "mg"
              },
              "RIBF": {
                "label": "Riboflavin",
                "quantity": 0.26,
                "unit": "mg"
              },
              "NIA": {
                "label": "Niacin",
                "quantity": 0.91,
                "unit": "mg"
              },
              "VITB6A": {
                "label": "Vitamin B-6",
                "quantity": 0.41,
                "unit": "mg"
              },
              "VITK1": {
                "label": "Vitamin K (phylloquinone)",
                "quantity": 22,
                "unit": "µg"
              },
              "FOLDFE": {
                "label": "Folate, DFE",
                "quantity": 30,
                "unit": "µg"
              },
              "FASAT": {
                "label": "Fatty acids, total saturated",
                "quantity": 0.28,
                "unit": "g"
              },
              "FAMS": {
                "label": "Fatty acids, total monounsaturated",
                "quantity": 0.07,
                "unit": "g"
              },
              "FAPU": {
                "label": "Fatty acids, total polyunsaturated",
                "quantity": 0.51,
                "unit": "g"
              }
            },
            "measureURI": "http://www.edamam.com/ontologies/edamam.owl#Measure_kilogram"
          }
        ]
      }
    ]
  }
end
