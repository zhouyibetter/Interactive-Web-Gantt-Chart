<script setup>
import { ref, onMounted } from 'vue';
import { gantt } from 'dhtmlx-gantt';
import { getData } from '@/api/data.js';
import "dhtmlx-gantt/codebase/dhtmlxgantt.css";

const tasks = getData();
const ganttContainer = ref(null);

onMounted(() => {
  gantt.config.date_format = "%Y-%m-%d %H:%i:%s";
  gantt.config.order_branch = true;
  gantt.config.order_branch_free = true;

  gantt.init(ganttContainer.value);
  gantt.parse(tasks);
});
</script>

<template>
  <div id="gantt" ref="ganttContainer"></div>
</template>

<style>
body,
html {
  margin: 0;
  padding: 0;
}

#gantt {
  height: 100vh;
  width: 100%;
}
</style>