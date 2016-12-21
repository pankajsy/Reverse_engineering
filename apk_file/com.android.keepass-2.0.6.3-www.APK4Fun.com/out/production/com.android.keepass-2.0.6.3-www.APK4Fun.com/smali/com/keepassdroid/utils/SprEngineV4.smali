.class public Lcom/keepassdroid/utils/SprEngineV4;
.super Lcom/keepassdroid/utils/SprEngine;
.source "SprEngineV4.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keepassdroid/utils/SprEngineV4$TargetResult;
    }
.end annotation


# instance fields
.field private final MAX_RECURSION_DEPTH:I

.field private final STR_REF_END:Ljava/lang/String;

.field private final STR_REF_START:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/keepassdroid/utils/SprEngine;-><init>()V

    .line 34
    const/16 v0, 0xc

    iput v0, p0, Lcom/keepassdroid/utils/SprEngineV4;->MAX_RECURSION_DEPTH:I

    .line 35
    const-string v0, "{REF:"

    iput-object v0, p0, Lcom/keepassdroid/utils/SprEngineV4;->STR_REF_START:Ljava/lang/String;

    .line 36
    const-string v0, "}"

    iput-object v0, p0, Lcom/keepassdroid/utils/SprEngineV4;->STR_REF_END:Ljava/lang/String;

    return-void
.end method

.method private addRefsToCache(Ljava/lang/String;Ljava/lang/String;Lcom/keepassdroid/utils/SprContextV4;)V
    .locals 1
    .param p1, "ref"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "ctx"    # Lcom/keepassdroid/utils/SprContextV4;

    .prologue
    .line 169
    if-nez p1, :cond_1

    .line 176
    :cond_0
    :goto_0
    return-void

    .line 170
    :cond_1
    if-eqz p2, :cond_0

    .line 171
    if-eqz p3, :cond_0

    .line 173
    iget-object v0, p3, Lcom/keepassdroid/utils/SprContextV4;->refsCache:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 174
    iget-object v0, p3, Lcom/keepassdroid/utils/SprContextV4;->refsCache:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private compileInternal(Ljava/lang/String;Lcom/keepassdroid/utils/SprContextV4;I)Ljava/lang/String;
    .locals 1
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "ctx"    # Lcom/keepassdroid/utils/SprContextV4;
    .param p3, "recursionLevel"    # I

    .prologue
    .line 56
    if-nez p1, :cond_0

    const-string v0, ""

    .line 60
    :goto_0
    return-object v0

    .line 57
    :cond_0
    if-nez p2, :cond_1

    const-string v0, ""

    goto :goto_0

    .line 58
    :cond_1
    const/16 v0, 0xc

    if-lt p3, v0, :cond_2

    const-string v0, ""

    goto :goto_0

    .line 60
    :cond_2
    invoke-direct {p0, p1, p2, p3}, Lcom/keepassdroid/utils/SprEngineV4;->fillRefPlaceholders(Ljava/lang/String;Lcom/keepassdroid/utils/SprContextV4;I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private fillRefPlaceholders(Ljava/lang/String;Lcom/keepassdroid/utils/SprContextV4;I)Ljava/lang/String;
    .locals 17
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "ctx"    # Lcom/keepassdroid/utils/SprContextV4;
    .param p3, "recursionLevel"    # I

    .prologue
    .line 65
    move-object/from16 v0, p2

    iget-object v14, v0, Lcom/keepassdroid/utils/SprContextV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    if-nez v14, :cond_0

    move-object/from16 v12, p1

    .line 123
    .end local p1    # "text":Ljava/lang/String;
    .local v12, "text":Ljava/lang/String;
    :goto_0
    return-object v12

    .line 67
    .end local v12    # "text":Ljava/lang/String;
    .restart local p1    # "text":Ljava/lang/String;
    :cond_0
    const/4 v8, 0x0

    .line 68
    .local v8, "offset":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    const/16 v14, 0x14

    if-ge v6, v14, :cond_1

    .line 69
    invoke-direct/range {p0 .. p2}, Lcom/keepassdroid/utils/SprEngineV4;->fillRefsUsingCache(Ljava/lang/String;Lcom/keepassdroid/utils/SprContextV4;)Ljava/lang/String;

    move-result-object p1

    .line 71
    const-string v14, "{REF:"

    sget-object v15, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    move-object/from16 v0, p1

    invoke-static {v0, v14, v8, v15}, Lcom/keepassdroid/utils/StrUtil;->indexOfIgnoreCase(Ljava/lang/String;Ljava/lang/String;ILjava/util/Locale;)I

    move-result v10

    .line 72
    .local v10, "start":I
    if-gez v10, :cond_2

    .end local v10    # "start":I
    :cond_1
    move-object/from16 v12, p1

    .line 123
    .end local p1    # "text":Ljava/lang/String;
    .restart local v12    # "text":Ljava/lang/String;
    goto :goto_0

    .line 73
    .end local v12    # "text":Ljava/lang/String;
    .restart local v10    # "start":I
    .restart local p1    # "text":Ljava/lang/String;
    :cond_2
    const-string v14, "}"

    add-int/lit8 v15, v10, 0x1

    sget-object v16, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-static {v0, v14, v15, v1}, Lcom/keepassdroid/utils/StrUtil;->indexOfIgnoreCase(Ljava/lang/String;Ljava/lang/String;ILjava/util/Locale;)I

    move-result v3

    .line 74
    .local v3, "end":I
    if-le v3, v10, :cond_1

    .line 76
    sub-int v14, v3, v10

    add-int/lit8 v14, v14, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v10, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 77
    .local v5, "fullRef":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v5, v1}, Lcom/keepassdroid/utils/SprEngineV4;->findRefTarget(Ljava/lang/String;Lcom/keepassdroid/utils/SprContextV4;)Lcom/keepassdroid/utils/SprEngineV4$TargetResult;

    move-result-object v9

    .line 79
    .local v9, "result":Lcom/keepassdroid/utils/SprEngineV4$TargetResult;
    if-eqz v9, :cond_3

    .line 80
    iget-object v4, v9, Lcom/keepassdroid/utils/SprEngineV4$TargetResult;->entry:Lcom/keepassdroid/database/PwEntryV4;

    .line 81
    .local v4, "found":Lcom/keepassdroid/database/PwEntryV4;
    iget-char v13, v9, Lcom/keepassdroid/utils/SprEngineV4$TargetResult;->wanted:C

    .line 83
    .local v13, "wanted":C
    if-eqz v4, :cond_4

    .line 85
    sparse-switch v13, :sswitch_data_0

    .line 105
    add-int/lit8 v8, v10, 0x1

    .line 68
    .end local v4    # "found":Lcom/keepassdroid/database/PwEntryV4;
    .end local v13    # "wanted":C
    :cond_3
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 87
    .restart local v4    # "found":Lcom/keepassdroid/database/PwEntryV4;
    .restart local v13    # "wanted":C
    :sswitch_0
    invoke-virtual {v4}, Lcom/keepassdroid/database/PwEntryV4;->getTitle()Ljava/lang/String;

    move-result-object v2

    .line 109
    .local v2, "data":Ljava/lang/String;
    :goto_3
    invoke-virtual/range {p2 .. p2}, Lcom/keepassdroid/utils/SprContextV4;->clone()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/keepassdroid/utils/SprContextV4;

    .line 110
    .local v11, "subCtx":Lcom/keepassdroid/utils/SprContextV4;
    iput-object v4, v11, Lcom/keepassdroid/utils/SprContextV4;->entry:Lcom/keepassdroid/database/PwEntryV4;

    .line 112
    add-int/lit8 v14, p3, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v11, v14}, Lcom/keepassdroid/utils/SprEngineV4;->compileInternal(Ljava/lang/String;Lcom/keepassdroid/utils/SprContextV4;I)Ljava/lang/String;

    move-result-object v7

    .line 113
    .local v7, "innerContent":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v5, v7, v1}, Lcom/keepassdroid/utils/SprEngineV4;->addRefsToCache(Ljava/lang/String;Ljava/lang/String;Lcom/keepassdroid/utils/SprContextV4;)V

    .line 114
    invoke-direct/range {p0 .. p2}, Lcom/keepassdroid/utils/SprEngineV4;->fillRefsUsingCache(Ljava/lang/String;Lcom/keepassdroid/utils/SprContextV4;)Ljava/lang/String;

    move-result-object p1

    .line 115
    goto :goto_2

    .line 90
    .end local v2    # "data":Ljava/lang/String;
    .end local v7    # "innerContent":Ljava/lang/String;
    .end local v11    # "subCtx":Lcom/keepassdroid/utils/SprContextV4;
    :sswitch_1
    invoke-virtual {v4}, Lcom/keepassdroid/database/PwEntryV4;->getUsername()Ljava/lang/String;

    move-result-object v2

    .line 91
    .restart local v2    # "data":Ljava/lang/String;
    goto :goto_3

    .line 93
    .end local v2    # "data":Ljava/lang/String;
    :sswitch_2
    invoke-virtual {v4}, Lcom/keepassdroid/database/PwEntryV4;->getUrl()Ljava/lang/String;

    move-result-object v2

    .line 94
    .restart local v2    # "data":Ljava/lang/String;
    goto :goto_3

    .line 96
    .end local v2    # "data":Ljava/lang/String;
    :sswitch_3
    invoke-virtual {v4}, Lcom/keepassdroid/database/PwEntryV4;->getPassword()Ljava/lang/String;

    move-result-object v2

    .line 97
    .restart local v2    # "data":Ljava/lang/String;
    goto :goto_3

    .line 99
    .end local v2    # "data":Ljava/lang/String;
    :sswitch_4
    invoke-virtual {v4}, Lcom/keepassdroid/database/PwEntryV4;->getNotes()Ljava/lang/String;

    move-result-object v2

    .line 100
    .restart local v2    # "data":Ljava/lang/String;
    goto :goto_3

    .line 102
    .end local v2    # "data":Ljava/lang/String;
    :sswitch_5
    invoke-virtual {v4}, Lcom/keepassdroid/database/PwEntryV4;->getUUID()Ljava/util/UUID;

    move-result-object v14

    invoke-virtual {v14}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    .line 103
    .restart local v2    # "data":Ljava/lang/String;
    goto :goto_3

    .line 116
    .end local v2    # "data":Ljava/lang/String;
    :cond_4
    add-int/lit8 v8, v10, 0x1

    .line 117
    goto :goto_2

    .line 85
    :sswitch_data_0
    .sparse-switch
        0x41 -> :sswitch_2
        0x49 -> :sswitch_5
        0x4e -> :sswitch_4
        0x50 -> :sswitch_3
        0x54 -> :sswitch_0
        0x55 -> :sswitch_1
    .end sparse-switch
.end method

.method private fillRefsUsingCache(Ljava/lang/String;Lcom/keepassdroid/utils/SprContextV4;)Ljava/lang/String;
    .locals 5
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "ctx"    # Lcom/keepassdroid/utils/SprContextV4;

    .prologue
    .line 179
    iget-object v1, p2, Lcom/keepassdroid/utils/SprContextV4;->refsCache:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 180
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-static {p1, v1, v2, v4}, Lcom/keepassdroid/utils/StrUtil;->replaceAllIgnoresCase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    .line 181
    goto :goto_0

    .line 183
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    return-object p1
.end method


# virtual methods
.method public compile(Ljava/lang/String;Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;
    .locals 2
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "entry"    # Lcom/keepassdroid/database/PwEntry;
    .param p3, "database"    # Lcom/keepassdroid/database/PwDatabase;

    .prologue
    .line 50
    new-instance v0, Lcom/keepassdroid/utils/SprContextV4;

    check-cast p3, Lcom/keepassdroid/database/PwDatabaseV4;

    .end local p3    # "database":Lcom/keepassdroid/database/PwDatabase;
    check-cast p2, Lcom/keepassdroid/database/PwEntryV4;

    .end local p2    # "entry":Lcom/keepassdroid/database/PwEntry;
    invoke-direct {v0, p3, p2}, Lcom/keepassdroid/utils/SprContextV4;-><init>(Lcom/keepassdroid/database/PwDatabaseV4;Lcom/keepassdroid/database/PwEntryV4;)V

    .line 52
    .local v0, "ctx":Lcom/keepassdroid/utils/SprContextV4;
    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/keepassdroid/utils/SprEngineV4;->compileInternal(Ljava/lang/String;Lcom/keepassdroid/utils/SprContextV4;I)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public findRefTarget(Ljava/lang/String;Lcom/keepassdroid/utils/SprContextV4;)Lcom/keepassdroid/utils/SprEngineV4$TargetResult;
    .locals 12
    .param p1, "fullRef"    # Ljava/lang/String;
    .param p2, "ctx"    # Lcom/keepassdroid/utils/SprContextV4;

    .prologue
    const/4 v11, 0x4

    const/4 v10, 0x0

    const/4 v5, 0x0

    const/4 v9, 0x1

    .line 127
    if-nez p1, :cond_1

    .line 165
    :cond_0
    :goto_0
    return-object v5

    .line 129
    :cond_1
    sget-object v6, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v6}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    .line 130
    const-string v6, "{REF:"

    invoke-virtual {p1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    const-string v6, "}"

    invoke-virtual {p1, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 134
    const-string v6, "{REF:"

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v7

    const-string v8, "{REF:"

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    sub-int/2addr v7, v8

    const-string v8, "}"

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    sub-int/2addr v7, v8

    invoke-virtual {p1, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 135
    .local v1, "ref":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v6

    if-le v6, v11, :cond_0

    .line 136
    invoke-virtual {v1, v9}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x40

    if-ne v6, v7, :cond_0

    .line 137
    const/4 v6, 0x3

    invoke-virtual {v1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x3a

    if-ne v6, v7, :cond_0

    .line 139
    const/4 v2, 0x0

    .line 140
    .local v2, "scan":C
    const/4 v4, 0x0

    .line 142
    .local v4, "wanted":C
    const/4 v6, 0x2

    invoke-virtual {v1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v2

    .line 143
    invoke-virtual {v1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v4

    .line 145
    new-instance v3, Lcom/keepassdroid/database/SearchParametersV4;

    invoke-direct {v3}, Lcom/keepassdroid/database/SearchParametersV4;-><init>()V

    .line 146
    .local v3, "sp":Lcom/keepassdroid/database/SearchParametersV4;
    invoke-virtual {v3}, Lcom/keepassdroid/database/SearchParametersV4;->setupNone()V

    .line 148
    invoke-virtual {v1, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/keepassdroid/database/SearchParametersV4;->searchString:Ljava/lang/String;

    .line 149
    const/16 v6, 0x54

    if-ne v2, v6, :cond_2

    iput-boolean v9, v3, Lcom/keepassdroid/database/SearchParametersV4;->searchInTitles:Z

    .line 158
    :goto_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 159
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwEntry;>;"
    iget-object v6, p2, Lcom/keepassdroid/utils/SprContextV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v6, v6, Lcom/keepassdroid/database/PwDatabaseV4;->rootGroup:Lcom/keepassdroid/database/PwGroup;

    invoke-virtual {v6, v3, v0}, Lcom/keepassdroid/database/PwGroup;->searchEntries(Lcom/keepassdroid/database/SearchParameters;Ljava/util/List;)V

    .line 161
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v6

    if-lez v6, :cond_0

    .line 162
    new-instance v6, Lcom/keepassdroid/utils/SprEngineV4$TargetResult;

    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/keepassdroid/database/PwEntryV4;

    invoke-direct {v6, p0, v5, v4}, Lcom/keepassdroid/utils/SprEngineV4$TargetResult;-><init>(Lcom/keepassdroid/utils/SprEngineV4;Lcom/keepassdroid/database/PwEntryV4;C)V

    move-object v5, v6

    goto/16 :goto_0

    .line 150
    .end local v0    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwEntry;>;"
    :cond_2
    const/16 v6, 0x55

    if-ne v2, v6, :cond_3

    iput-boolean v9, v3, Lcom/keepassdroid/database/SearchParametersV4;->searchInUserNames:Z

    goto :goto_1

    .line 151
    :cond_3
    const/16 v6, 0x41

    if-ne v2, v6, :cond_4

    iput-boolean v9, v3, Lcom/keepassdroid/database/SearchParametersV4;->searchInUrls:Z

    goto :goto_1

    .line 152
    :cond_4
    const/16 v6, 0x50

    if-ne v2, v6, :cond_5

    iput-boolean v9, v3, Lcom/keepassdroid/database/SearchParametersV4;->searchInPasswords:Z

    goto :goto_1

    .line 153
    :cond_5
    const/16 v6, 0x4e

    if-ne v2, v6, :cond_6

    iput-boolean v9, v3, Lcom/keepassdroid/database/SearchParametersV4;->searchInNotes:Z

    goto :goto_1

    .line 154
    :cond_6
    const/16 v6, 0x49

    if-ne v2, v6, :cond_7

    iput-boolean v9, v3, Lcom/keepassdroid/database/SearchParametersV4;->searchInUUIDs:Z

    goto :goto_1

    .line 155
    :cond_7
    const/16 v6, 0x4f

    if-ne v2, v6, :cond_0

    iput-boolean v9, v3, Lcom/keepassdroid/database/SearchParametersV4;->searchInOther:Z

    goto :goto_1
.end method
