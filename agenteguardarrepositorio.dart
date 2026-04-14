import 'dart:io';

void main() async {
  print('\n======================================================');
  print('🤖 Agente para Guardar Repositorio en GitHub 🤖');
  print('======================================================\n');

  // 1. Inicializar repositorio git local si es necesario
  print('⚙️ Verificando e inicializando git local...');
  await Process.run('git', ['init']);

  // 2. Pedir y definir el nombre de la rama
  stdout.write('🌿 Ingresa nombre de la rama destino [default: main]: ');
  String? branchInput = stdin.readLineSync();
  String branch = (branchInput == null || branchInput.trim().isEmpty) ? 'main' : branchInput.trim();

  // Forzamos el renombre de la rama local a la elegida (muy útil para primeros commits)
  await Process.run('git', ['branch', '-M', branch]);

  // 3. Revisar remotos configurados
  var remoteResult = await Process.run('git', ['remote', '-v']);
  String remotes = remoteResult.stdout as String;
  
  if (!remotes.contains('origin')) {
    stdout.write('🔗 Ingresa el link de GitHub (ej. https://github.com/usu/repo.git): ');
    String? repoLink = stdin.readLineSync();
    if (repoLink != null && repoLink.trim().isNotEmpty) {
      var addRemoteResult = await Process.run('git', ['remote', 'add', 'origin', repoLink.trim()]);
      if (addRemoteResult.exitCode == 0) {
        print('✅ Remoto "origin" agregado exitosamente.\n');
      } else {
        print('❌ Error al agregar remoto: \n${addRemoteResult.stderr}\n');
      }
    } else {
      print('⚠️ Operación de remoto saltada. (Puede fallar el push si no existe "origin")\n');
    }
  } else {
    print('📌 Remoto detectado y configurado:\n$remotes');
  }

  // 4. Agregar archivos (stage)
  print('📦 Agregando archivos al trackeo (git add .)...');
  await Process.run('git', ['add', '.']);
  
  // 5. Realizar el Commit
  stdout.write('📝 Ingresa el mensaje de commit [default: "Actualización automática"]: ');
  String? commitMessageInput = stdin.readLineSync();
  String commitMessage = (commitMessageInput == null || commitMessageInput.trim().isEmpty) 
      ? 'Actualización automática' 
      : commitMessageInput.trim();

  var commitResult = await Process.run('git', ['commit', '-m', commitMessage]);
  if (commitResult.exitCode == 0) {
    print('✅ Commit creado: "$commitMessage"');
  } else {
    String commitOut = commitResult.stdout.toString();
    if (commitOut.toLowerCase().contains('nothing to commit') || commitOut.toLowerCase().contains('nada para hacer commit')) {
      print('ℹ️ No hay archivos nuevos o modificados para hacer commit.');
    } else {
      print('⚠️ Resultados del commit:\n$commitOut\n${commitResult.stderr}');
    }
  }

  // 6. Subir los cambios a GitHub
  print('\n🚀 Subiendo archivos a Github en la rama "$branch"...');
  var pushResult = await Process.run('git', ['push', '-u', 'origin', branch]);
  
  if (pushResult.exitCode == 0) {
    print('🎉 ¡El proyecto se ha subido exitosamente a GitHub!');
  } else {
    print('❌ Ocurrió un error al subir los cambios a GitHub (Exit Code: ${pushResult.exitCode}).');
    print('⚠️ Posibles causas: Falta de credenciales, link equivocado o la rama no permite pushes directamente.');
    print('\n--- Detalles del error de Git ---');
    print(pushResult.stderr);
  }

  print('======================================================\n');
}
