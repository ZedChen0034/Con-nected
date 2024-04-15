class SensitiveWordUtil:
    MIN_MATCH_TYPE = 1
    MAX_MATCH_TYPE = 2

    @staticmethod
    def init_sensitive_word_map(sensitive_word_set):
        map_ = {}
        for key_word_set in sensitive_word_set:
            now_map = map_
            for key_char in key_word_set:
                if key_char in now_map:
                    now_map = now_map[key_char]
                else:
                    new_word_map = {"isEnd": "0"}
                    now_map[key_char] = new_word_map
                    now_map = new_word_map
                if key_char == key_word_set[-1]:
                    now_map["isEnd"] = "1"
        return map_

    @staticmethod
    def get_sensitive_word(sensitive_word_set, txt, match_type):
        sensitive_word_list = set()
        map_ = SensitiveWordUtil.init_sensitive_word_map(sensitive_word_set)
        for i in range(len(txt)):
            length = SensitiveWordUtil.check_sensitive_word(map_, txt, i, match_type)
            if length > 0:
                sensitive_word_list.add(txt[i:i + length])
        return sensitive_word_list

    @staticmethod
    def replace_sensitive_word(sensitive_word_set, txt, replace_str, match_type):
        result_txt = txt
        set_ = SensitiveWordUtil.get_sensitive_word(sensitive_word_set, txt, match_type)
        for word in set_:
            result_txt = result_txt.replace(word, replace_str)
        return result_txt

    @staticmethod
    def check_sensitive_word(now_map, txt, begin_index, match_type):
        flag = False
        match_flag = 0
        for i in range(begin_index, len(txt)):
            word = txt[i]
            if word in now_map:
                match_flag += 1
                now_map = now_map[word]
                if now_map["isEnd"] == "1":
                    flag = True
                    if match_type == SensitiveWordUtil.MIN_MATCH_TYPE:
                        break
            else:
                break
        if match_flag < 2 or not flag:
            match_flag = 0
        return match_flag


if __name__ == "__main__":
    sensitive_word_set = {"world", "exit", "part"}
    string = "All the world’s a stage, and all the men and women merely players. They have their exits and their entrances; And one man in his time plays many parts."

    set_ = SensitiveWordUtil.get_sensitive_word(sensitive_word_set, string, SensitiveWordUtil.MAX_MATCH_TYPE)
    print("In the sentence, the number of sensitive words is：{}，including：{}".format(len(set_), set_))
    # set_ = SensitiveWordUtil.get_sensitive_word(sensitive_word_set, string, SensitiveWordUtil.MIN_MATCH_TYPE)
    # print("In the sentence, the number of sensitive words is：{}，including：{}".format(len(set_), set_))

    # filter_str = SensitiveWordUtil.replace_sensitive_word(sensitive_word_set, string, '*', SensitiveWordUtil.MAX_MATCH_TYPE)
    # print(filter_str)
    filter_str = SensitiveWordUtil.replace_sensitive_word(sensitive_word_set, string, '*', SensitiveWordUtil.MIN_MATCH_TYPE)
    print(filter_str)
