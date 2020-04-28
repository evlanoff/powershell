$names = Get-ChildItem -Path . -File 

ForEach ($file in $names) {

    #Список файлов с одинарным счётчиком

    if ( $file.Name.Substring($file.Name.IndexOf('#') + 1, 2).Replace('.', '').Length -le 1 ){

        $insert_at_begin_filename = $file.Name.Substring($file.Name.IndexOf('#') + 1, 2).Insert(0, '0').Replace('.', '')
        #Вставляем номер в начало названия файла
        Rename-Item -Path $file.Name -NewName "$insert_at_begin_filename. $file"
        #удаляем номер с конца
        Rename-Item -Path $file.Name -NewName ([regex]::Replace($file.Name, '\s+#\d', ''))
        #Альтернативный способ
        #$file.Name | Rename-Item -Path $file.Name -NewName { $file.Name -replace "\s+#\d", "" }
    } 

    if( $file.Name.Substring($file.Name.IndexOf('#') + 1, 2).Replace('.', '').Length -ge 2 ) {
        
        $insert_at_begin_filename = $file.Name.Substring($file.Name.IndexOf('#') + 1, 2).Replace('.', '')
        Rename-Item -Path $file.Name -NewName "$insert_at_begin_filename. $file"
        Rename-Item -Path $file.Name -NewName ([regex]::Replace($file.Name, '\s+#\d+', ''))
        #Альтернативный способ
        #$file.Name | Rename-Item -Path $file.Name -NewName { $file.Name -replace "\s+#\d+", "" }
    }
    
    
 }
